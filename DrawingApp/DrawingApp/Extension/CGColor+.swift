//
//  CGColor+.swift
//  DrawingApp
//
//  Created by elly on 11/21/23.
//

import Foundation
import CoreGraphics

extension CGColor {
    static var red = CGColor(red: 1.0, green: 0, blue: 0, alpha: 1.0)
    static var white = CGColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    static var black = CGColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    
    static func random() -> CGColor {
        let red = CGFloat.random(in: 0...255) / 255.0
        let green = CGFloat.random(in: 0...255) / 255.0
        let blue = CGFloat.random(in: 0...255) / 255.0
        
        return CGColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    static func random(without color: CGColor) -> CGColor {
        let randomColor = CGColor.random()
        return randomColor == color ? CGColor.random() : randomColor
    }
}
