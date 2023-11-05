//
//  Path.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import Foundation
import UIKit

struct Path: Drawable {
    let id: UUID = UUID()
    
    let points: [Point]
    let foregroundColor: Color?
    
    init(points: [Point], foregroundColor: Color? = nil) {
        self.points = points
        self.foregroundColor = foregroundColor
    }
    
    init(rect: CGRect, foregroundColor: Color? = nil) {
        let points = [
            rect.origin,
            rect.offsetBy(dx: rect.width, dy: 0).origin,
            rect.offsetBy(dx: rect.width, dy: rect.height).origin,
            rect.offsetBy(dx: 0, dy: rect.height).origin,
            rect.origin
        ].map(Point.init)
        self.init(points: points, foregroundColor: foregroundColor)
    }
}

extension Path {
    var path: Path { self }
}

extension Path {
    var cgPath: CGPath {
        let path = UIBezierPath()
        guard let firstPoint = points.first else { return path.cgPath }
        path.move(to: firstPoint.cgPoint)
        for point in points[1...] {
            path.addLine(to: point.cgPoint)
        }
        path.close()
        return path.cgPath
    }
}
