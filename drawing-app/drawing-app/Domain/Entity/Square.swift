//
//  Square.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/06.
//

import UIKit
import QuartzCore

struct Square: Drawable {
    
    let id: String
    var points: [CGPoint] = []
    var foregroundColor: UIColor
    var shapeLayer: CAShapeLayer?

    init(points: [CGPoint]) {
        self.id = UUID().uuidString
        self.points = points
        self.foregroundColor = UIColor.randomSystemColor
        initShapeLayer()
    }
    
    func getShapeLayer() -> CAShapeLayer? {
        return shapeLayer
    }
    
    func makeStroke() -> CAShapeLayer {
        let path = UIBezierPath()
        path.move(to: points[0])
        path.addLine(to: points[1])
        path.addLine(to: points[2])
        path.addLine(to: points[3])
        path.close()
        
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.red.cgColor
        shape.lineWidth = 3
        return shape
    }
    
    private mutating func initShapeLayer() {
        let path = UIBezierPath()
        path.move(to: points[0])
        path.addLine(to: points[1])
        path.addLine(to: points[2])
        path.addLine(to: points[3])
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = foregroundColor.cgColor
        
        self.shapeLayer = shapeLayer
    }
    
}
