//
//  DrawingManager.swift
//  Drawing
//
//  Created by ByungHoon Ann on 2023/11/06.
//

import UIKit

final class DrawingManager {
    
    var rectangleShapes = [Shape]()
    var drawingShapes = [Shape]()
    
    func makeRandomColor() -> UIColor {
        let color: UIColor = .randomColor
        return color != .systemRed ? color : makeRandomColor()
    }
    
    func makeDrawing(path: UIBezierPath) {
        let id = UUID().uuidString
        let shape = Shape(id: id, type: .drawing, color: makeRandomColor(), frame: path.bounds)
        drawingShapes.append(shape)
    }
    
    func makeRectangle(canvasBounds: CGRect) -> RectangleButton {
        let shape = makeShape(canvasBounds: canvasBounds)
        let rectangle = RectangleButton(shape: shape)
        rectangleShapes.append(shape)
        return rectangle
    }
    
    func makeRectangleFrame(canvasBounds: CGRect) -> CGRect {
        let maxWidth = canvasBounds.width - 100
        let maxHeight = canvasBounds.height - 100
        let originX = CGFloat.random(in: 0...maxWidth)
        let originY = CGFloat.random(in: 0...maxHeight)
        let origin = CGPoint(x: originX, y: originY)
        return CGRect(origin: origin, size: Define.rectangleSize)
    }
    
    func makeShape(canvasBounds: CGRect) -> Shape {
        let id = UUID().uuidString
        return Shape(
            id: id,
            type: .rectangle,
            color: makeRandomColor(),
            frame: makeRectangleFrame(canvasBounds: canvasBounds)
        )
    }
}
