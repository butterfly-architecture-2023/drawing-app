//
//  Rectangle.swift
//  SwiftDrawingApp
//
//  Created by Han Songe on 2023/11/06.
//

import UIKit

protocol Shape {
    func frame() -> CGRect
    func moveToPoint() -> CGPoint
    func addLineToPoints() -> [CGPoint]
    func setFillColor()
}

struct Rectangle: Shape {
    private let id: String = UUID().uuidString
    private let origin: CGPoint
    private let size: CGSize
    private let fillColor: UIColor
    
    init(origin: CGPoint, size: CGSize, fillColor: UIColor) {
        self.origin = origin
        self.size = size
        self.fillColor = fillColor
    }
    
    func frame() -> CGRect {
        CGRect(origin: origin, size: size)
    }
    
    func moveToPoint() -> CGPoint {
        CGPoint(x: 0.0, y: 0.0)
    }
    
    func addLineToPoints() -> [CGPoint] {
        var points: [CGPoint] = []
        points.append(CGPoint(x: size.width, y: 0.0))
        points.append(CGPoint(x: size.width, y: size.height))
        points.append(CGPoint(x: 0.0, y: size.height))
        return points
    }
    
    func setFillColor() {
        fillColor.set()
    }
}
