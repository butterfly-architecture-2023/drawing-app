//
//  DrawingViewController.swift
//  drawing-app
//
//  Created by 박진섭 on 11/4/23.
//

import UIKit
import SnapKit
import Combine

class DrawingViewController: UIViewController {
    private let rectangleViewModel = RectangleViewModel()
    private var rectangleSubscriber: AnyCancellable?

    private var addedRectangleViewDic: [Int: RectangleView] = [:]

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
        subscribeAddedRectangle()
    }
    
    private func subscribeAddedRectangle() {
        rectangleSubscriber = rectangleViewModel.addedRectangleSubject
            .sink(receiveValue: { newRectangle in
                let rectangleView = RectangleView(newRectangle)
                self.view.addSubview(rectangleView)
        })
    }

    @objc private func addRectangle() {
        let boundary = Boundary(maxXPosition: self.view.frame.width, maxYPostiion: self.view.frame.height)
        rectangleViewModel.addRandomRectanlge(in: boundary)
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
        self.addedRectangleViewDic.values.forEach { $0.resetBorder() }
        let selectedRectangle = addedRectangleViewDic[id]
        selectedRectangle?.changeBorder()
    }
}
