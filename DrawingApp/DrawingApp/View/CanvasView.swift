//
//  CanvasView.swift
//  DrawingApp
//
//  Created by 오킹 on 2023/11/08.
//

import UIKit

class CanvasView: UIView {

    func draw(rectangle: Rectangle) {
        let layer = CAShapeLayer()
        layer.path = .init(rect: rectangle.rect, transform: nil)
        layer.fillColor = rectangle.backgroundColor.uiColor.cgColor
        self.layer.addSublayer(layer)
    }
    
    func draw(line: Drawing?) {
        guard let from = line?.points.first else { return }
        guard let to = line?.points.last else { return }
                
        let bezierPath = UIBezierPath()
        bezierPath.move(to: from)
        bezierPath.addLine(to: to)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 5.0
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        self.layer.addSublayer(shapeLayer)
    }
}
