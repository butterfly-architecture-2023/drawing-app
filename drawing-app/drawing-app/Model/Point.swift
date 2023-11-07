//
//  Point.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/07.
//

import UIKit

struct Point {
    
    let x: CGFloat
    let y: CGFloat
    
    // MARK: - Initializer
    
    init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
    
}

// MARK: - Extension UIScreen

extension UIScreen {
    
    static let minX = main.bounds.minX
    static let minY = main.bounds.minY
    static let maxX = main.bounds.maxX
    static let maxY = main.bounds.maxY
    
}
