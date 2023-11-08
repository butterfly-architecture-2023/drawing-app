//
//  CanvasView.swift
//  DrawingApp
//
//  Created by 오킹 on 2023/11/08.
//

import UIKit

class CanvasView: UIView {

    func add(rectangle: Rectangle) {
        let layer = CAShapeLayer()
        layer.path = .init(rect: rectangle.rect, transform: nil)
        layer.fillColor = rectangle.backgroundColor.uiColor.cgColor
        self.layer.addSublayer(layer)
    }
}
