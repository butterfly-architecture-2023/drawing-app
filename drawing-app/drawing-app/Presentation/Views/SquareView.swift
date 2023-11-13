//
//  SquareView.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/08.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture

final class SquareView: UIView {
    
    // MARK: - Property
    
    private let disposeBag = DisposeBag()
    private var squareInfo: Square?
    private let didTap = BehaviorRelay<Bool>(value: true)
    
    // MARK: - Initializer
    
    init(with info: Square) {
        super.init(frame: info.rect)
        
        squareInfo = info
        backgroundColor = info.color.uicolor
        rxBind()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func rxBind() {
            rx
            .tapGesture()
            .when(.recognized)
            .withLatestFrom(didTap)
            .asDriver(onErrorDriveWith: .empty())
            .drive(with: self, onNext: { owner, didTap in
                didTap ? owner.setStrock() : owner.removeStrock()
                owner.didTap.accept(!didTap)
            })
            .disposed(by: disposeBag)
        
    }
    
    private func setStrock() {
        layer.borderColor = UIColor.systemRed.cgColor
        layer.borderWidth = 10
    }
    
    private func removeStrock() {
        layer.borderWidth = 0
    }
    
}
