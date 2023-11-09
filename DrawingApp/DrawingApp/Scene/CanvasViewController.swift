//
//  ViewController.swift
//  DrawingApp
//
//  Created by 김도형 on 2023/11/09.
//

import UIKit

import RxCocoa
import RxSwift

final class CanvasViewController: UIViewController {
    @IBOutlet private weak var rectButton: UIButton!
    @IBOutlet private weak var lineButton: UIButton!
    
    private let disposeBag = DisposeBag()
    private let viewModel = CanvasViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.bindAction()
        self.bindState()
    }

    private func bindAction() {
        self.rectButton.rx.tap
            .bind(to: self.viewModel.action.clickDrawRect)
            .disposed(by: self.disposeBag)
    }
    
    private func bindState() {
        self.viewModel.state
            .rectDidMake
            .map({ return UIView(frame: CGRect(origin: $0.origin, size: $0.size)) })
            .do(onNext: { $0.backgroundColor = UIColor.random() })
            .withUnretained(self)
            .subscribe(onNext: { owner, rect in
                owner.view.addSubview(rect)
            })
            .disposed(by: self.disposeBag)
    }

}

