//
//  CanvasViewModel.swift
//  DrawingApp
//
//  Created by 김도형 on 2023/11/09.
//

import Foundation

import RxSwift
import RxCocoa

extension CanvasViewModel {
    struct Action {
        let clickDrawRect: AnyObserver<Void>
        let touch: AnyObserver<CGPoint>
    }
    
    struct State {
        let rectDidMake: Observable<Rect>
        let selectedRect: Observable<Rect>
        
        fileprivate var rects = [Rect]()
    }
}

final class CanvasViewModel: ViewModel {
    let action: Action
    private(set) var state: State
    
    private let rectMaker: RectMaker
    private let disposeBag = DisposeBag()
    
    init(rectMaker: RectMaker = RectMaker()) {
        /// Action
        let clickDrawRectSubject = PublishSubject<Void>()
        let touchSubject = PublishSubject<CGPoint>()
        
        /// State
        let rectDidMakeSubject = PublishSubject<Rect>()
        let selectedRectSubject = PublishSubject<Rect>()
        
        self.rectMaker = rectMaker
        self.action = Action(clickDrawRect: clickDrawRectSubject.asObserver(),
                             touch: touchSubject.asObserver())
        self.state = State(rectDidMake: rectDidMakeSubject.asObservable(),
                           selectedRect: selectedRectSubject.asObservable())
        
        let generatedRandomRect = clickDrawRectSubject
            .withUnretained(self)
            .flatMap({ owner, _ in owner.rectMaker.makeRandomRect() })
            .share()
            
        generatedRandomRect
            .bind(to: rectDidMakeSubject)
            .disposed(by: self.disposeBag)
        
        generatedRandomRect
            .withUnretained(self)
            .subscribe(onNext: { owner, rect in
                owner.state.rects.append(rect)
            })
            .disposed(by: self.disposeBag)
        
        touchSubject
            .withUnretained(self)
            .compactMap({ owner, point in return owner.state.rects.filter({ $0.rect.contains(point) }).first })
            .bind(to: selectedRectSubject)
            .disposed(by: self.disposeBag)
    }
    
    
}
