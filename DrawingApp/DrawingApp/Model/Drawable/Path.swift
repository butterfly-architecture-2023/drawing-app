//
//  Path.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import Foundation

struct Path: Drawable {
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
        ].map(Point.init)
        self.init(points: points, foregroundColor: foregroundColor)
    }
}

extension Path {
    var path: Path { self }
}
