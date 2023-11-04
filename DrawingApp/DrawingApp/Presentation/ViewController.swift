//
//  ViewController.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import UIKit

final class ViewController: BaseViewController {

    private let squareAddingUseCase: SquareAddingType
    private let squareSelectionUseCase: SquareSelectionType

    private let drawingContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
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
    private let createDrawingButton = CreateButton(text: "드로잉")

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

    init(
        squareAddingUseCase: SquareAddingType,
        squareSelectionUseCase: SquareSelectionType
    ) {
        self.squareAddingUseCase = squareAddingUseCase
        self.squareSelectionUseCase = squareSelectionUseCase
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

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

extension ViewController {
    @objc
    private func squareButtonDidTap() {

    }
}
