//
//  Line.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/09.
//

import UIKit

struct Line: Drawable {
    let id: String
    var points: [CGPoint] = []
    let foregroundColor: UIColor
    
    init(id: String = UUID().uuidString, startPoint: CGPoint, foregroundColor: UIColor = UIColor.randomSystemColor) {
        self.id = id
        self.foregroundColor = foregroundColor
        stack(startPoint)
    }
    
    mutating func stack(_ point: CGPoint) {
        points.append(point)
    }
    
    func getLine() -> CAShapeLayer {
        let path = UIBezierPath()
        path.move(to: points[0])
        
        points.forEach {
            path.addLine(to: $0)
        }
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = foregroundColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 3
        
        return shapeLayer
    }
}
