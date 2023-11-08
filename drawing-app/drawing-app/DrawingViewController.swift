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
    private let rectangleViewModel: RectangleViewModel
    private var newRectangleSubscriber: AnyCancellable?
    private var selectedRectangleSubscriber: AnyCancellable?
    private var addedRectangleViewDic: [Int: RectangleView]
    private var selectedRectangleView: RectangleView?

    init(rectangleViewModel: RectangleViewModel, addedRectangleViewDic: [Int : RectangleView]) {
        self.addedRectangleViewDic = addedRectangleViewDic
        self.rectangleViewModel = .init()
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var addRectangleButton: AddShapeButton {
        return AddShapeButton(title: "사각형", imageName: "square", #selector(addRectangle))
    }

    private var drawingButton: AddShapeButton {
        return AddShapeButton(title: "드로잉", imageName: "scribble.variable", #selector(startDrawing))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        addButtonStackView()
        subscribeNewRectangle()
        subscribeSelectedRectangle()
    }
    
    private func subscribeNewRectangle() {
        newRectangleSubscriber = rectangleViewModel.addedRectangle
            .sink(receiveValue: { newRectangle in
                let rectangleView = RectangleView(newRectangle)
                self.addRectangleViewToDic(id: newRectangle.hashValue, rectangleView)
                self.view.addSubview(rectangleView)
        })
    }

    private func addRectangleViewToDic(id: Int, _ rectangleView: RectangleView) {
        self.addedRectangleViewDic[id] = rectangleView
        rectangleView.delegate = self
    }

    private func subscribeSelectedRectangle() {
        selectedRectangleSubscriber = rectangleViewModel.selectedRectangleBorderColor
            .sink(receiveValue: { rgba in
                self.addedRectangleViewDic.values.forEach { $0.resetBorder() }
                self.selectedRectangleView?.changeBorder(rgba: rgba)
            })
    }

    @objc private func addRectangle() {
        let boundary = Boundary(maxXPosition: self.view.frame.width, maxYPostiion: self.view.frame.height)
        rectangleViewModel.addRandomRectangle(in: boundary)
    }

    @objc private func startDrawing() {
        print(self.view.subviews)
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
        self.selectedRectangleView = addedRectangleViewDic[id]
        self.rectangleViewModel.changeSelectedRectangleRGBA(id)
    }
}
