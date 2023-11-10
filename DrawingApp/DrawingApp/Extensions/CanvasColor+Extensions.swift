//
//  CanvasColor+Extensions.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/09.
//

import UIKit
import DrawingAppBusinessDomain

extension CanvasColor {
  func toUIColor() -> UIColor {
    UIColor(
      red: CGFloat(colorSet.red),
      green: CGFloat(colorSet.green),
      blue: CGFloat(colorSet.blue),
      alpha: 1)
  }
}
