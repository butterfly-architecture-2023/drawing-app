//
//  ViewController.swift
//  Drawing
//
//  Created by ByungHoon Ann on 2023/11/05.
//

import UIKit

final class ViewController: UIViewController {
    let canvasView = UIView()
    let makeRectangleButton = UIButton()
    let makeDrawLineButton = UIButton()
    private let stackView = UIStackView()

    var currentDrawingPath: UIBezierPath?
    var isDrawingMode = false
    
    private let drawManager: DrawingManager

    init(drawManager: DrawingManager = DrawingManager()) {
        self.drawManager = drawManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDrawingMode else { return }
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: canvasView)
        currentDrawingPath?.move(to: location)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: canvasView)
        
        guard isDrawingMode else { return }
        
        currentDrawingPath?.addLine(to: location)
        drawDrawing()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDrawingMode else { return }
        guard let path = currentDrawingPath else { return }
        drawManager.makeDrawing(path: path)
    }
}

/// Event Action

extension ViewController {
    @objc func handleShapeTap(_ sender: RectangleButton) {
        sender.active()
        deselectSelectedShape(id: sender.id)
    }
    
    @objc func makeRectangleButtonTapped(_ sender: UIButton) {
        makeDrawLineButton.isSelected = false
        isDrawingMode = false
        currentDrawingPath = nil
        deselectSelectedShape()
        drawRectangles()
    }
    
    @objc func makeDrawLineButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        isDrawingMode = sender.isSelected
        currentDrawingPath = isDrawingMode ? UIBezierPath() : nil
    }
}

/// Drawing

extension ViewController {
    func drawDrawing() {
        if let path = currentDrawingPath {
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = path.cgPath
            shapeLayer.strokeColor = UIColor.black.cgColor
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.lineWidth = 5.0
            canvasView.layer.addSublayer(shapeLayer)
        }
    }
    
    func clearCanvasView() {
        canvasView.subviews.forEach { $0.removeFromSuperview() }
        if let sublayers = canvasView.layer.sublayers {
            for sublayer in sublayers {
                sublayer.removeFromSuperlayer()
            }
        }
    }
    
    func drawRectangles() {
        let rectangle = drawManager.makeRectangle(canvasBounds: canvasView.bounds)
        rectangle.addTarget(self, action: #selector(handleShapeTap), for: .touchUpInside)
        canvasView.addSubview(rectangle)
    }
    
    func deselectSelectedShape(id: String? = nil ) {
        _ = getRectangleViews()
            .filter { $0.id != id }
            .map { $0.clear() }
    }
    
    func getRectangleViews() -> [RectangleButton] {
        return canvasView.subviews
            .compactMap { $0 as? RectangleButton }
    }
}

/// UI Layout

private extension ViewController {
    func layout() {
        insertUI()
        basicSetUI()
        anchorUI()
    }
    
    func insertUI() {
        [
            canvasView,
            stackView
        ].forEach {
            view.addSubview($0)
        }
        stackView.addArrangedSubview(makeRectangleButton)
        stackView.addArrangedSubview(makeDrawLineButton)
    }
    
    func basicSetUI() {
        canvasViewBasicSet()
        makeRectangleButtonBasicSet()
        makeDrawLineButtonBasicSet()
        stackViewBasicSet()
    }
    
    func anchorUI() {
        canvasViewAnchor()
        stackViewAnchor()
        makeRectangleButtonAnchor()
        makeDrawLineButtonAnchor()
    }
    
    func stackViewBasicSet() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func canvasViewBasicSet() {
        canvasView.backgroundColor = .white
        canvasView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func makeRectangleButtonBasicSet() {
        makeRectangleButton.setTitle("사각형", for: .normal)
        makeRectangleButton.setTitleColor(.darkGray, for: .normal)
        makeRectangleButton.backgroundColor = .white
        makeRectangleButton.addTarget(self, action: #selector(makeRectangleButtonTapped), for: .touchUpInside)
        makeRectangleButton.layer.borderWidth = 1
        makeRectangleButton.layer.borderColor = UIColor.black.cgColor
        makeRectangleButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func makeDrawLineButtonBasicSet() {
        makeDrawLineButton.setTitle("그리기", for: .normal)
        makeDrawLineButton.setTitleColor(.darkGray, for: .normal)
        makeDrawLineButton.setTitle("그리기", for: .selected)
        makeDrawLineButton.setTitleColor(.black, for: .selected)
        makeDrawLineButton.backgroundColor = .white
        makeDrawLineButton.addTarget(self, action: #selector(makeDrawLineButtonTapped), for: .touchUpInside)
        makeDrawLineButton.layer.borderWidth = 1
        makeDrawLineButton.layer.borderColor = UIColor.black.cgColor
        makeDrawLineButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func canvasViewAnchor() {
        NSLayoutConstraint.activate(
            [
                canvasView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                canvasView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                canvasView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                canvasView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ]
        )
    }
    
    func stackViewAnchor() {
        NSLayoutConstraint.activate(
            [
                stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                stackView.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
    
    func makeRectangleButtonAnchor() {
        NSLayoutConstraint.activate(
            [
                makeRectangleButton.widthAnchor.constraint(equalToConstant: 100),
                makeRectangleButton.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
    
    func makeDrawLineButtonAnchor() {
        NSLayoutConstraint.activate(
            [
                makeDrawLineButton.widthAnchor.constraint(equalToConstant: 100),
                makeDrawLineButton.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
}
