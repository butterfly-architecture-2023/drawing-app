//
//  UIColor+.swift
//  DrawingApp
//
//  Created by 김도형 on 2023/11/09.
//

import UIKit

extension UIColor {
    
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
    
}
