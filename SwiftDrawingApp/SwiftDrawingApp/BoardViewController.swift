//
//  BoardViewController.swift
//  SwiftDrawingApp
//
//  Created by Han Songe on 2023/11/06.
//

import UIKit

final class BoardViewController: UIViewController {
    private let canvasView = UIView(frame: .zero)
    private let menuButtonStackView = UIStackView(frame: .zero)
    private let addRectangleButton = UIButton(type: .system)
    private let addDrawingButton = UIButton(type: .system)
    
    private var viewModel: BoardViewModel!
    
    static func create(with viewModel: BoardViewModel) -> BoardViewController {
        let viewController = BoardViewController()
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        
        setupCanvasView()
        setupMenuButtonStackView()
    }
    
    private func setupCanvasView() {
        view.addSubview(canvasView)
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            canvasView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            canvasView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            canvasView.topAnchor.constraint(equalTo: view.topAnchor),
            canvasView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupMenuButtonStackView() {
        menuButtonStackView.axis = .horizontal
        menuButtonStackView.spacing = 10.0
        
        setupMenuButtons()
        menuButtonStackView.addArrangedSubview(addRectangleButton)
        menuButtonStackView.addArrangedSubview(addDrawingButton)
        
        view.addSubview(menuButtonStackView)
        menuButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            menuButtonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menuButtonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupMenuButtons() {
        addRectangleButton.configuration = createButtonConfiguration(title: "사각형", imageName: "plus.rectangle")
        addDrawingButton.configuration = createButtonConfiguration(title: "드로잉", imageName: "hand.draw")
        
        addRectangleButton.addAction(
            UIAction { _ in
                // TODO: 사각형 추가 버튼 탭동작 추가
            },
            for: .touchUpInside
        )
        addDrawingButton.addAction(
            UIAction { _ in
                // TODO: 드로잉 추가 버튼 탭동작 추가
            },
            for: .touchUpInside
        )
    }
    
    private func createButtonConfiguration(title: String, imageName: String) -> UIButton.Configuration {
        var config = UIButton.Configuration.filled()
        config.title = title
        config.image = UIImage(systemName: imageName)
        config.imagePlacement = .top
        config.imagePadding = 5.0
        return config
    }
}
