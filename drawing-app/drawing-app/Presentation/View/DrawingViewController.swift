//
//  ViewController.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/04.
//

import UIKit

class DrawingViewController: UIViewController {

    private lazy var squareAddButton: UIButton = CanvasButton.init(title: "사각형") { [weak self] in
        self?.viewModel.tappedSquareButton(with: self?.canvasView.frame)
    }
    private lazy var lineAddButton: UIButton = CanvasButton.init(title: "드로잉") { [weak self] in
        self?.viewModel.tappedDrawingButton()
    }
    
    private lazy var canvasView: CanvasView = .init { [weak self] touchPoint in
        self?.viewModel.tappedCanvas(with: touchPoint)
    }
    
    private lazy var buttonStackView: UIStackView = {
        let stackView: UIStackView = .init(arrangedSubviews: [squareAddButton, lineAddButton])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let viewModel: DrawingViewModel
    
    init(viewModel: DrawingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        bind()
    }
    
    private func configUI() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            buttonStackView.widthAnchor.constraint(equalToConstant: 300),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(canvasView)
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            canvasView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            canvasView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            canvasView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            canvasView.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -20)
        ])
    }
    
    private func bind() {
        viewModel
            .$components
            .dropFirst()
            .sink { [weak self] drawable in
                self?.draw(by: drawable)
            }.store(in: &viewModel.cancellables)
        
        viewModel
            .$selectedComponents
            .dropFirst()
            .sink { [weak self] components in
                self?.stroke(by: components)
            }.store(in: &viewModel.cancellables)
    }
    
    private func draw(by drawable: [Drawable]) {
        drawable.forEach {
            if let square = $0 as? Square {
                let layer = square.makeShapeLayer()
                canvasView.draw(layer)
            }
        }
    }
    
    private func stroke(by drawble: Drawable?) {
        if drawble == nil {
            
        } else {
            if let square = drawble as? Square {
                let layer = square.makeStroke()
                canvasView.draw(layer)
            }
        }
    }
}
