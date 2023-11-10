//
//  UIColor+.swift
//  DrawingApp
//
//  Created by elly on 11/4/23.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        let red = CGFloat.random(in: 0...255) / 255.0
        let green = CGFloat.random(in: 0...255) / 255.0
        let blue = CGFloat.random(in: 0...255) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func without(_ color: UIColor) -> UIColor {
        return self == color ? UIColor.random() : self
    }
}
