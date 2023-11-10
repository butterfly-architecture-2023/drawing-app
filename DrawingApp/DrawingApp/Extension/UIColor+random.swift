//
//  UIColor+random.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        let red = Double.random(in: 0.0..<1.0)
        let green = Double.random(in: 0.0..<1.0)
        let blue = Double.random(in: 0.0..<1.0)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
