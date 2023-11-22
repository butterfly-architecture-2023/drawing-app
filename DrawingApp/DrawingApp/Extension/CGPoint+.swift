//
//  CGPoint+.swift
//  DrawingApp
//
//  Created by elly on 11/4/23.
//

import Foundation

extension CGPoint {
    static func random(in bounds: CGRect) -> CGPoint {
        let width = 100
        let height = 100
        let randomX = Int.random(in: 0...(Int(bounds.width)) - width - 16)
        let randomY = Int.random(in: 0...(Int(bounds.height)) - height - 200)
        return CGPoint(x: randomX, y: randomY)
    }
    
    func isInArea(_ points: [CGPoint]) -> Bool {
        let point = points.first ?? CGPoint(x: 0, y: 0)
        let area = CGRect(x: self.x, y: self.y, width: 100, height: 100)
        return area.contains(point)
    }
}
