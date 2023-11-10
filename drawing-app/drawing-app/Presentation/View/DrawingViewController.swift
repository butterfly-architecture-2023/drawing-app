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
        self?.viewModel.tappedLineButton()
    }
    
    private lazy var canvasView: CanvasView = .init(
        touchesBegan: { [weak self] touchPoint in
        self?.viewModel.tappedCanvas(with: touchPoint)
    }, touchesMoved: { [weak self] touchPoint in
        self?.viewModel.movedCanvas(with: touchPoint)
    }, touchesEnded: { [weak self] in
        self?.viewModel.touchesEnded()
    })
    
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
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
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
            .$oldSelectedComponent
            .sink { [weak self] component in
                self?.deselect(component)
            }.store(in: &viewModel.cancellables)
        
        viewModel
            .$selectedComponent
            .sink { [weak self] component in
                self?.select(by: component)
            }.store(in: &viewModel.cancellables)
        
        viewModel
            .$currentLine
            .compactMap({ $0 })
            .sink { [weak self] line in
                self?.updateLine(line)
            }.store(in: &viewModel.cancellables)
    }
    
    private func draw(by drawable: [Drawable]) {
        drawable.forEach {
            if let square = $0 as? Square, let layer = square.getShapeLayer() {
                canvasView.draw(layer)
            }
            if let line = $0 as? Line {
                canvasView.draw(line.getLine())
            }
        }
    }
    
    private func updateLine(_ drawable: Drawable) {
        if let line = drawable as? Line {
            canvasView.draw(line.getLine())
        }
    }
    
    private func select(by drawable: Drawable?) {
        guard let square = drawable as? Square else { return }
        guard let squareLayer = square.getShapeLayer(), let strokeLayer = square.getStrokeLayer() else { return }
        canvasView.drawStroke(strokeLayer, above: squareLayer)
    }
    
    private func deselect(_ drawable: Drawable?) {
        guard let square = drawable as? Square else { return }
        guard let strokeLayer = square.getStrokeLayer() else { return }
        canvasView.removeStroke(strokeLayer)
    }
}
