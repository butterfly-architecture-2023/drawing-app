//
//  Path.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import Foundation

struct Path {
    let points: [Point]
    
    init(points: [Point]) {
        self.points = points
    }
    
    init(rect: CGRect) {
        let points = [
            rect.origin,
            rect.offsetBy(dx: rect.width, dy: 0).origin,
            rect.offsetBy(dx: 0, dy: rect.height).origin,
            rect.offsetBy(dx: rect.width, dy: rect.height).origin
        ].map(Point.init)
        self.init(points: points)
    }
}
