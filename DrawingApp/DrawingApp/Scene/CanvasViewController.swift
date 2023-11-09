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
            .map({ RectView(id: $0.id, frame: $0.rect) })
            .withUnretained(self)
            .subscribe(onNext: { owner, rect in
                owner.view.addSubview(rect)
            })
            .disposed(by: self.disposeBag)
        
        self.viewModel.state
            .selectedRect
            .withUnretained(self)
            .compactMap({ owner, rect -> RectView? in
                owner.view.subviews.filter({ ($0 as? RectView)?.id == rect.id }).first as? RectView
            })
            .subscribe(onNext: { rectView in
                rectView.setSelected()
            })
            .disposed(by: self.disposeBag)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let location = touches.first?.location(in: self.view) else { return }
        self.viewModel.action.touch.onNext(location)
    }
}

