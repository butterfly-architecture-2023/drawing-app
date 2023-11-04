//
//  Color.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import Foundation
import UIKit

struct Color {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
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
