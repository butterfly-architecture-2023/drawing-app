//
//  DrawingViewController.swift
//  drawing-app
//
//  Created by 박진섭 on 11/4/23.
//

import UIKit
import SnapKit

class DrawingViewController: UIViewController {
    
    private var firstTouchPoint: CGPoint?
    private var endTouchPoint: CGPoint?
    private var touchPoints: [CGPoint?] = []

    private var addRectangleButton: UIButton {
        let button = UIButton()
        button.configuration = makeButtonConfigure(title: "사각형", imageName: "square")
        button.addTarget(self, action: #selector(tabAddRectangleButton) , for: .touchUpInside)
        return button
    }

    private var drawingButton: UIButton {
        let button = UIButton()
        button.configuration = makeButtonConfigure(title: "드로잉", imageName: "scribble.variable")
        button.addTarget(self, action: #selector(tabDrawingButton), for: .touchUpInside)
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

    @objc private func tabAddRectangleButton() {
        let rectangle = makeRandomRectangle()
        let rectangleStyle = rectangle.style
        let rectangleView = UIImageView(frame: .init(origin: .init(x: rectangle.x, y: rectangle.y), size: .init(width: rectangle.width, height: rectangle.height)))
        rectangleView.backgroundColor = .init(red: CGFloat(rectangleStyle.backgroundColor.red) / 255,
                                              green: CGFloat(rectangleStyle.backgroundColor.green) / 255,
                                              blue: CGFloat(rectangleStyle.backgroundColor.blue) / 255,
                                              alpha: rectangle.style.backgroundColor.alpha)
        self.view.addSubview(rectangleView)
    }

    @objc private func tabDrawingButton() {
        print("Tapped drawing button!")
    }

    private func makeRandomRectangle() -> Rectangle {
        let width = 100.0
        let height = 100.0
        let maxXPosition = self.view.frame.width - width
        let maxYPosition = self.view.frame.height - height
        let randomXPosition = Double.random(in: 0...maxXPosition)
        let randomYPosition = Double.random(in: 0...maxYPosition)
        let randomRedValue = Int.random(in: 0...255)
        let randomGreenValue = Int.random(in: 0...255)
        let randomBlueValue = Int.random(in: 0...255)
        let randomAlphaValue = Double.random(in: 0...1)
        let randomRectangle = Rectangle(width: width, height: height,
                                        x: randomXPosition, y: randomYPosition,
                                        style: .init(backgroundColor: .init(red: randomRedValue, green: randomGreenValue, blue: randomBlueValue, alpha: randomAlphaValue), borderColor: nil, borderWidth: nil))
        return randomRectangle
    }


    private func makeButtonConfigure(title: String, imageName: String) -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        config.background.strokeColor = .black
        config.background.strokeWidth = 1.0
        config.title = title
        config.imagePlacement = .top
        config.image = UIImage(systemName: imageName)
        config.imagePadding = 10
        config.baseForegroundColor = .black
        return config
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
