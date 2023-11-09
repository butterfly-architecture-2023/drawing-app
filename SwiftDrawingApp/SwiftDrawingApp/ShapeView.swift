//
//  RectangleView.swift
//  SwiftDrawingApp
//
//  Created by Han Songe on 2023/11/07.
//

import UIKit

final class ShapeView: UIView {
    private let shape: Shape
    
    init(shape: Shape) {
        self.shape = shape
        super.init(frame: shape.frame())
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: shape.moveToPoint())
        shape.addLineToPoints().forEach { point in
            path.addLine(to: point)
        }
        path.close()
        shape.setFillColor()
        path.fill()
    }
}
