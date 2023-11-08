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

    init(points: [CGPoint]) {
        self.id = UUID().uuidString
        self.points = points
        self.foregroundColor = Color.getRandomColor()
    }
    
    func makeShapeLayer() -> CAShapeLayer {
        let path = CGMutablePath()
        
        path.move(to: points[0])
        path.addLine(to: points[1])
        path.addLine(to: points[2])
        path.addLine(to: points[3])
        
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = foregroundColor.cgColor
        return shape
    }
    
    func makeStroke() -> CAShapeLayer {
        let path = CGMutablePath()
        
        path.move(to: points[0])
        path.addLine(to: points[1])
        path.addLine(to: points[2])
        path.addLine(to: points[3])
        
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = Color.getBorderColor().cgColor
        shape.lineWidth = 3
        return shape
    }
}
