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
    
    private var currentLineImageView: UIImageView?
    
    // MARK: - Property
    
    private let disposeBag = DisposeBag()
    private var viewModel: CanvasViewModelProtocol?

    private var path: Path?
    private var lineColor = SystemColor.random.uicolor
    private var isDrawable = false
    
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
        
        drawingButton
            .rx
            .tap
            .asDriver()
            .throttle(.milliseconds(3))
            .drive(with: self, onNext: { owner, _ in
                owner.isDrawable.toggle()
            })
            .disposed(by: disposeBag)
        
        viewModel?.output
            .showSquare
            .asDriver(onErrorDriveWith: .empty())
            .drive(with: self, onNext: { owner, square in
                owner.addSquareView(square)
            })
            .disposed(by: disposeBag)
        
        canvasView
            .rx
            .panGesture()
            .filter { [weak self] _ in self?.isDrawable ?? true }
            .asDriver(onErrorDriveWith: .empty())
            .drive(with: self, onNext: { owner, panGesture in
                let gesture = panGesture.location(in: owner.canvasView)
                
                switch panGesture.state {
                case .began:
                    owner.setupPath()
                    owner.path?.lastPoint = .init(x: gesture.x, y: gesture.y)
                    
                case .changed:
                    let currentPoint = CGPoint(x: gesture.x, y: gesture.y )
                    guard let lastPoint = owner.path?.lastPoint else { return }
                    
                    owner.drawLineFrom(from: lastPoint, to: currentPoint)
                    owner.path?.lastPoint = currentPoint
                    
                case .ended:
                    owner.clearPath()
                    
                default:
                    return
                }
                
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Function
    
    private func addSquareView(_ square: Square) {
        let view = SquareView(with: square)
        canvasView.addSubview(view)
    }
    
    private func setupPath() {
        path = Path()
        currentLineImageView = UIImageView()
        
        guard let currentLineImageView else { return }
        canvasView.addSubview(currentLineImageView)
    }
    
    private func clearPath() {
        lineColor = SystemColor.random.uicolor
        path = nil
        currentLineImageView = nil
        isDrawable = false
    }

}

// MARK: - Drawing

extension CanvasViewController {

    private func drawLineFrom(from: CGPoint, to: CGPoint) {
        UIGraphicsBeginImageContextWithOptions(canvasView.frame.size, false, 1.0)
        
        currentLineImageView?.image?.draw(in: canvasView.frame)
        currentLineImageView?.frame = canvasView.frame
        
        setupContext(from: from, to: to)
        
        currentLineImageView?.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
    
    private func setupContext(from: CGPoint, to: CGPoint) {
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: from)
        context?.addLine(to: to)
        context?.setLineCap(.round)
        context?.setLineWidth(path?.lineWidth ?? .zero)
        context?.setStrokeColor(lineColor.cgColor)
        context?.setBlendMode(.normal)
        context?.strokePath()
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
            $0.width.equalTo(Layout.buttonWidth.size)
            $0.height.equalTo(Layout.buttonHeigth.size)
            $0.right.equalTo(view.snp.centerX).offset(-10)
            $0.bottom.equalToSuperview().inset(50)
        }
        
        drawingButton.snp.makeConstraints {
            $0.width.equalTo(Layout.buttonWidth.size)
            $0.height.equalTo(Layout.buttonHeigth.size)
            $0.left.equalTo(view.snp.centerX).offset(10)
            $0.bottom.equalToSuperview().inset(50)
        }
        
        canvasView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.bottom.equalTo(drawingButton.snp.top).offset(-20)
        }
    }
    
}
