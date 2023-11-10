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
        let touchedRect: Observable<Rect>
        
        fileprivate var rects = [UUID: Rect]()
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
        let touchedRectSubject = PublishSubject<Rect>()
        
        self.rectMaker = rectMaker
        self.action = Action(clickDrawRect: clickDrawRectSubject.asObserver(),
                             touch: touchSubject.asObserver())
        self.state = State(rectDidMake: rectDidMakeSubject.asObservable(),
                           touchedRect: touchedRectSubject.asObservable())
        
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
                owner.state.rects[rect.id] = rect
            })
            .disposed(by: self.disposeBag)
        
        touchSubject
            .withUnretained(self)
            .compactMap({ owner, point -> Rect? in
                guard var rect = owner.state.rects.values.filter({ $0.cgRect.contains(point) }).first
                else { return nil }
                
                rect.isSelected = !rect.isSelected
                owner.state.rects[rect.id] = rect
                return rect
            })
            .bind(to: touchedRectSubject)
            .disposed(by: self.disposeBag)
    }

}
