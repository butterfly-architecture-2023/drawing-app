//
//  UIColor+Extension.swift
//  Drawing
//
//  Created by ByungHoon Ann on 2023/11/05.
//

import UIKit

extension UIColor {
    static var randomColor: UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    static func convertColor(drawingColor: DrawingRGB) -> UIColor {
        return UIColor(displayP3Red: CGFloat(drawingColor.red),
                       green: CGFloat(drawingColor.green),
                       blue: CGFloat(drawingColor.blue),
                       alpha: CGFloat(drawingColor.alpha))
    }
    
    func drawingColor() -> DrawingRGB {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return DrawingRGB(red: Float(red),
                          blue: Float(blue),
                          green: Float(green),
                          alpha: Float(alpha))
    }
}
