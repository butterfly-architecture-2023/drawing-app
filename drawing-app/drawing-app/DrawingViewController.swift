//
//  DrawingViewController.swift
//  drawing-app
//
//  Created by 박진섭 on 11/4/23.
//

import UIKit
import SnapKit

class DrawingViewController: UIViewController {
    private let addRectangleModel = AddRectangleButtonViewModel()

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
        self.firstTouchPoint = touches.first?.location(in: self.view)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endTouchPoint = touches.first?.location(in: self.view)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchPoints.append(touches.first?.location(in: self.view))
    }

    @objc private func addRectangle() {
        let rectangle = addRectangleModel.makeRandomRectangle(maxXPosition: self.view.frame.width, maxYPosition: self.view.frame.height)
        let rectangleView = makeRectangleView(rectangle)
        self.view.addSubview(rectangleView)
    }

    @objc private func startDrawing() {
        print("Tapped drawing button!")
    }

    private func makeRectangleView(_ rectangle: Rectangle) -> UIView {
        let rectangleStyle = rectangle.style
        let rectangleView = UIImageView(frame: .init(origin: .init(x: rectangle.x, y: rectangle.y), size: .init(width: rectangle.width, height: rectangle.height)))
        rectangleView.backgroundColor = .init(red: rectangleStyle.backgroundRGBA.red,
                                              green: rectangleStyle.backgroundRGBA.green,
                                              blue: rectangleStyle.backgroundRGBA.blue,
                                              alpha: rectangle.style.backgroundRGBA.alpha)
        return rectangleView
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
