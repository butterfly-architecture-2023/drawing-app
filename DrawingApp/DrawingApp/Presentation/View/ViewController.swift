//
//  ViewController.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import UIKit

import RxCocoa
import RxSwift

final class ViewController: BaseViewController {

    // MARK: - UI

    private lazy var drawingContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white

        let panGestureRecognizer = UIPanGestureRecognizer(
            target: self,
            action: #selector(panGestureHandler(_:))
        )
        view.addGestureRecognizer(panGestureRecognizer)
        return view
    }()
    private lazy var createSquareButton: CreateButton = {
        let button = CreateButton(text: "사각형")
        button.addTarget(
            self,
            action: #selector(squareButtonDidTap),
            for: .touchUpInside
        )
        return button
    }()
    private lazy var createDrawingButton = CreateButton(text: "드로잉")
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [createSquareButton, createDrawingButton]
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()

    // MARK: - Properties

    private let viewModel: ViewModel

    private lazy var input = ViewModel.Input(
        createSquareButtonDidTap: createSquareButtonDidTap.asSignal(),
        createDrawingButtonDidTap: createDrawingButton.rx.tap.asSignal(),
        drawingViewPanGesture: drawingViewPanGesture.asSignal(),
        squareViewDidTap: squareViewDidTap.asSignal()
    )
    private lazy var output = viewModel.transform(input: input)
    private let disposeBag = DisposeBag()

    private let createSquareButtonDidTap = PublishRelay<Position>()
    private let drawingViewPanGesture = PublishRelay<(location: CGPoint, gesture: GestureState)>()
    private let squareViewDidTap = PublishRelay<Int>()

    private var selectedSquareView: SquareView?

    // MARK: - Init

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    // MARK: - Helpers

    override func setViews() {
        super.setViews()
        view.addSubview(drawingContainerView)
        view.addSubview(buttonStackView)
    }

    override func setConstraints() {
        super.setConstraints()
        NSLayoutConstraint.activate([
            drawingContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            drawingContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            drawingContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(
                equalTo: drawingContainerView.bottomAnchor,
                constant: 16
            ),
            buttonStackView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -16
            ),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            buttonStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
    }
}

// MARK: - Bind
extension ViewController {
    private func bind() {
        output.createdSquare
            .asSignal()
            .emit(onNext: { [weak self] square in
                guard let self = self else { return }

                let squareView = SquareView(
                    id: square.id,
                    position: square.position,
                    color: square.color
                )
                squareView.delegate = self
                drawingContainerView.addSubview(squareView)
            })
            .disposed(by: disposeBag)

        output.changedState
            .asSignal()
            .emit(onNext: { [weak self] color, coordinates in
                guard let self = self,
                      let color = color
                else { return }

                self.drawCurrentPath(
                    currentColor: color,
                    currentCoordinates: coordinates
                )
            })
            .disposed(by: disposeBag)

        output.squareViewSelectedState
            .asSignal()
            .emit(onNext: { [weak self] isSelected in
                guard let self = self,
                      let selectedSquareView = selectedSquareView
                else { return }

                selectedSquareView.updateBorderColor(isSelected: isSelected)
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Drawing Helpers
extension ViewController {
    private func drawCurrentPath(currentColor: ColorType, currentCoordinates: [CGPoint]) {
        let path = setBezierPath(currentCoordinates: currentCoordinates)
        let lineLayer = setLineLayer(path: path, currentColor: currentColor)
        drawingContainerView.layer.addSublayer(lineLayer)
    }

    private func setBezierPath(currentCoordinates: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: currentCoordinates[0])

        for i in 1..<currentCoordinates.count {
            path.addLine(to: currentCoordinates[i])
        }
        return path
    }

    private func setLineLayer(path: UIBezierPath, currentColor: ColorType) -> CAShapeLayer {
        let lineLayer = CAShapeLayer()
        lineLayer.path = path.cgPath
        lineLayer.strokeColor = currentColor.uiColor.cgColor
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.lineWidth = 5
        return lineLayer
    }
}

// MARK: - Actions
extension ViewController {
    @objc
    private func squareButtonDidTap() {
        let maxPosition = Position(
            x: drawingContainerView.bounds.width - Constants.squareWidth,
            y: drawingContainerView.bounds.height - Constants.squareHeight
        )
        createSquareButtonDidTap.accept(maxPosition)
    }

    @objc
    private func panGestureHandler(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: drawingContainerView)

        var gestureState: GestureState
        switch sender.state {
        case .began:
            gestureState = .began
        case .changed:
            gestureState = .changed
        case .ended:
            gestureState = .ended
        default:
            return
        }

        drawingViewPanGesture.accept((location, gestureState))
    }
}

// MARK: - SquareViewDelegate
extension ViewController: SquareViewDelegate {
    func squareViewTapped(_ squareView: SquareView, square id: Int) {
        self.selectedSquareView = squareView
        squareViewDidTap.accept(id)
    }
}
