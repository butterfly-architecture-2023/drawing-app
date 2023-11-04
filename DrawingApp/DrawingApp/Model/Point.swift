//
//  Point.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import Foundation

struct Point: Equatable {
    let x: CGFloat
    let y: CGFloat
    
    init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
    
    init(cgPoint: CGPoint) {
        self.x = cgPoint.x
        self.y = cgPoint.y
    }
}
