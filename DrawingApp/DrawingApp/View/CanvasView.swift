//
//  CanvasView.swift
//  DrawingApp
//
//  Created by 오킹 on 2023/11/08.
//

import UIKit

class CanvasView: UIView {

    func draw(rectangle: Rectangle, delegate: RectangleViewDelegate? = nil) {
        let view = RectangleView(id: rectangle.id, frame: rectangle.rect)
        view.delegate = delegate
        view.backgroundColor = rectangle.backgroundColor.uiColor
        
        self.addSubview(view)
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
