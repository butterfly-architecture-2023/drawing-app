//
//  UIScreen+Extensions.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/05.
//

import UIKit

extension UIScreen {
  static let screenWidth = UIScreen.main.bounds.size.width
  static let screenHeight = UIScreen.main.bounds.size.height
  static let screenSize: (Double, Double) = (screenWidth, screenHeight)
}
