//
//  UIColor+Extension.swift
//  DrawingApp
//
//  Created by leeyeon2 on 11/4/23.
//

import Foundation
import UIKit

extension UIColor {
    public class var randomColor: UIColor {
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}
