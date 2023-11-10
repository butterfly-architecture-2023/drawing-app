//
//  Square.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/06.
//

import UIKit

struct Square: Drawable {
    
    let id: String
    var points: [CGPoint] = []
    let foregroundColor: UIColor
    var shapeLayer: CAShapeLayer?
    var strokeLayer: CAShapeLayer?

    init(id: String = UUID().uuidString, points: [CGPoint], foregroundColor: UIColor = UIColor.randomSystemColor) {
        self.id = id
        self.points = points
        self.foregroundColor = foregroundColor
        initShapeLayer()
    }
    
    func getShapeLayer() -> CAShapeLayer? {
        return shapeLayer
    }
    
    func getStrokeLayer() -> CAShapeLayer? {
        return strokeLayer
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
        
        let strokeLayer = CAShapeLayer()
        strokeLayer.path = path.cgPath
        strokeLayer.fillColor = UIColor.clear.cgColor
        strokeLayer.strokeColor = UIColor.red.cgColor
        strokeLayer.lineWidth = 3
        
        self.shapeLayer = shapeLayer
        self.strokeLayer = strokeLayer
    }
    
}
