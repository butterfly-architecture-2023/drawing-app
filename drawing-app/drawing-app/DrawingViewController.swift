//
//  DrawingViewController.swift
//  drawing-app
//
//  Created by 박진섭 on 11/4/23.
//

import UIKit
import SnapKit

class DrawingViewController: UIViewController {
    private let randomRectangleFactory = RandomRectangleFactory()
    
    private var addedRectangleViews: [RectangleView] = []

    private var firstTouchPoint: CGPoint?
    private var endTouchPoint: CGPoint?
    private var touchPoints: [CGPoint?] = []

    private var addRectangleButton: AddShapeButton {
        let button = AddShapeButton(title: "사각형", imageName: "square")
        button.addTarget(self, action: #selector(addRectangle), for: .touchUpInside)
        return button
    }

    private var drawingButton: AddShapeButton {
        let button = AddShapeButton(title: "드로잉", imageName: "scribble.variable")
        button.addTarget(self, action: #selector(startDrawing), for: .touchUpInside)
        return button
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        addButtonStackView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchPoints = []
        guard let point = touches.first?.location(in: self.view) else { return }

        self.firstTouchPoint = touches.first?.location(in: self.view)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endTouchPoint = touches.first?.location(in: self.view)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchPoints.append(touches.first?.location(in: self.view))
    }

    @objc private func addRectangle() {
        let rectangle = randomRectangleFactory.make(maxXPosition: self.view.frame.width, maxYPosition: self.view.frame.height)
        let rectangleView = RectangleView(rectangle)
        rectangleView.delegate = self
        addedRectangleViews.append(rectangleView)
        self.view.addSubview(rectangleView)
    }

    @objc private func startDrawing() {
        print("Tapped drawing button!")
    }

    private func addButtonStackView() {
        let stackView = UIStackView(arrangedSubviews: [addRectangleButton, drawingButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        self.view.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(100)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}

extension DrawingViewController: RectangleViewDelegate {
    func tap(_ id: Int) {
        self.addedRectangleViews.forEach { $0.resetBorder() }
        guard let selectedRectangle = self.addedRectangleViews.first(where: { $0.ID == id }) else { return }
        selectedRectangle.changeBorder()
    }
}
