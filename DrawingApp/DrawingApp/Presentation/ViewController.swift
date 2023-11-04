//
//  ViewController.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import UIKit

final class ViewController: BaseViewController {

    private let createRectangleButton = CreateButton(text: "사각형")
    private let createDrawingButton = CreateButton(text: "드로잉")

    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [createRectangleButton, createDrawingButton]
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func setViews() {
        super.setViews()
        view.addSubview(buttonStackView)
    }

    override func setConstraints() {
        super.setConstraints()
        NSLayoutConstraint.activate([
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
