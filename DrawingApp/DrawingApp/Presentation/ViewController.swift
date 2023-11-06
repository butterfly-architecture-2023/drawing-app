//
//  ViewController.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import UIKit

final class ViewController: BaseViewController {

    // MARK: - Properties

    private var selectedButtonType: ButtonType?

    private let squareManagementUseCase: SquareManagementUseCase
    private let squareSelectionUseCase: SquareSelectionUseCase
    private let drawingUseCase: DrawingUseCase

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
    private lazy var createDrawingButton: CreateButton = {
        let button = CreateButton(text: "드로잉")
        button.addTarget(
            self,
            action: #selector(drawingButtonDidTap),
            for: .touchUpInside
        )
        return button
    }()
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

    // MARK: - Init

    init(
        squareAddingUseCase: SquareManagementUseCase,
        squareSelectionUseCase: SquareSelectionUseCase,
        drawingManagementUseCase: DrawingUseCase
    ) {
        self.squareManagementUseCase = squareAddingUseCase
        self.squareSelectionUseCase = squareSelectionUseCase
        self.drawingUseCase = drawingManagementUseCase
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

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

// MARK: - Drawing Helpers
extension ViewController {
    private func drawCurrentPath() {
        let currentCoordinates = drawingUseCase.readCurrentCoordinates()

        guard let currentColor = drawingUseCase.readCurrentColor(),
              currentCoordinates.count >= 2
        else { return }

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
        selectedButtonType = .square

        let maxPosition = Position(
            x: drawingContainerView.bounds.width - Constants.squareWidth,
            y: drawingContainerView.bounds.height - Constants.squareHeight
        )

        let square = squareManagementUseCase.createSquare(within: maxPosition)
        let squareView = SquareView(id: square.id, position: square.position, color: square.color)
        squareView.delegate = self
        drawingContainerView.addSubview(squareView)
    }

    @objc
    private func drawingButtonDidTap() {
        selectedButtonType = .drawing
    }

    @objc
    private func panGestureHandler(_ sender: UIPanGestureRecognizer) {
        guard selectedButtonType == .drawing else { return }

        let location = sender.location(in: drawingContainerView)

        switch sender.state {
        case .began:
            drawingUseCase.startDrawing(at: location)

        case .changed:
            drawingUseCase.continueDrawing(to: location)
            drawCurrentPath()

        case .ended:
            drawingUseCase.endDrawing()

        default:
            return
        }
    }
}

// MARK: - SquareViewDelegate
extension ViewController: SquareViewDelegate {
    func squareViewTapped(_ squareView: SquareView, square id: Int) {
        guard selectedButtonType == .square else { return }

        if var square = squareManagementUseCase.readSquare(id: id) {

            if square.isSelected {
                squareSelectionUseCase.deselectSquare(&square)
            } else {
                squareSelectionUseCase.selectSquare(&square)
            }

            squareManagementUseCase.updateSquare(square)
            squareView.updateBorderColor(isSelected: square.isSelected)
        }
    }
}
