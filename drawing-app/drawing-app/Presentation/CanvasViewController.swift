//
//  CanvasViewController.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/06.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

final class CanvasViewController: UIViewController {
    
    // MARK: - Views
    
    private lazy var makeSquareButton = RoundedButton(drawingType: .square)
    private lazy var drawingButton = RoundedButton(drawingType: .drawing)
    
    private lazy var canvasView = UIView()
    
    // MARK: - Property
    
    private let disposeBag = DisposeBag()
    private var viewModel: CanvasViewModelProtocol?
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        rxBind()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel?.input.canvasSize.accept(canvasView.bounds)
    }
    
    // MARK: - Initializer
    
    init(viewModel: CanvasViewModelProtocol = CanvasViewModel()) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - RxBind
    private func rxBind() {
        makeSquareButton
            .rx
            .tap
            .asDriver()
            .throttle(.milliseconds(3))
            .drive(with: self, onNext: { owner, _ in
                owner.viewModel?.input.didTapMakeSquareButton.accept(())
            })
            .disposed(by: disposeBag)
        
        viewModel?.output
            .showSquare
            .asDriver(onErrorDriveWith: .empty())
            .drive(with: self, onNext: { owner, square in
                owner.addSquareView(square)
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Function
    
    private func addSquareView(_ square: Square) {
        let view = SquareView(with: square)
        canvasView.addSubview(view)
    }

}

// MARK: - configure UI

extension CanvasViewController {
    
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(makeSquareButton)
        view.addSubview(drawingButton)
        view.addSubview(canvasView)
        
        makeSquareButton.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(50)
            $0.right.equalTo(view.snp.centerX).offset(-10)
            $0.bottom.equalToSuperview().inset(50)
        }
        
        drawingButton.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(50)
            $0.left.equalTo(view.snp.centerX).offset(10)
            $0.bottom.equalToSuperview().inset(50)
        }
        
        canvasView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.bottom.equalTo(drawingButton.snp.top).offset(-20)
        }
    }
    
}
