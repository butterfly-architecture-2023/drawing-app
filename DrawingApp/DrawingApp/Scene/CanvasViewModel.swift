//
//  CanvasViewModel.swift
//  DrawingApp
//
//  Created by 김도형 on 2023/11/09.
//

import UIKit

import RxSwift
import RxCocoa

extension CanvasViewModel {
    struct Action {
        let clickDrawRect: AnyObserver<Void>
    }
    
    struct State {
        let rectDidMake: Observable<Rect>
    }
}

final class CanvasViewModel: ViewModel {
    let action: Action
    let state: State
    
    private let rectManager: RectManager
    private let disposeBag = DisposeBag()
    
    init(rectMaker: RectManager = RectManager()) {
        let clickDrawRectSubject = PublishSubject<Void>()
        let rectDidMakeSubject = PublishSubject<Rect>()
        
        self.rectManager = rectMaker
        self.action = Action(clickDrawRect: clickDrawRectSubject.asObserver())
        self.state = State(rectDidMake: rectDidMakeSubject.asObservable())
        
        clickDrawRectSubject
            .flatMap({ self.rectManager.makeRandomRect() })
            .bind(to: rectDidMakeSubject)
            .disposed(by: self.disposeBag)
    }
    
    
}
