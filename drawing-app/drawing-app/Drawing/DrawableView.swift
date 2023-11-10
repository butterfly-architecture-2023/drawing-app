//
//  DrawableView.swift
//  drawing-app
//
//  Created by 박진섭 on 11/9/23.
//

import UIKit

class DrawableView: UIImageView {
    var startDraw: Bool = false
    var lastPoint: CGPoint = .zero
    var brushWidth: CGFloat = 3.0
    var color: UIColor = .black
    var opacity = 1.0

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        lastPoint = touch.location(in: self)
    }

    private func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        if startDraw {
            UIGraphicsBeginImageContext(self.frame.size)
            guard let context = UIGraphicsGetCurrentContext() else { return }
            self.image?.draw(in: self.bounds)

            context.move(to: fromPoint)
            context.addLine(to: toPoint)

            context.setLineCap(.round)
            context.setBlendMode(.normal)
            context.setLineWidth(brushWidth)
            context.setStrokeColor(color.cgColor)

            context.strokePath()

            self.image = UIGraphicsGetImageFromCurrentImageContext()
            self.alpha = opacity
            UIGraphicsEndImageContext()
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let currentPoint = touch.location(in: self)
        drawLine(from: lastPoint, to: currentPoint)
        lastPoint = currentPoint
    }
}
