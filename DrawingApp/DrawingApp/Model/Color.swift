//
//  Color.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import Foundation
import UIKit

struct Color: CustomDebugStringConvertible {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    
    var debugDescription: String {
        String(
            format: "#%02X%02X%02X",
            Int(red * 255),
            Int(green * 255),
            Int(blue * 255)
        )
    }
    
    static let systemRed = Color(uiColor: .systemRed)
}

extension Color {
    init?(uiColor: UIColor) {
        guard let components = uiColor.cgColor.components else {
            return nil
        }
        red = components[0]
        green = components[1]
        blue = components[2]
    }
    
    var uiColor: UIColor {
        UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
