//
//  UIColor+Extensions.swift
//  DrawingApp
//
//  Created by 안상희 on 11/7/23.
//

import UIKit.UIColor

extension UIColor {
  static var systemRandomColor: UIColor {
    systemColor.randomElement() ?? .systemMint
  }
  
  private static var systemColor: [UIColor] {
    [
      .systemBlue,
      .systemBrown,
      .systemCyan,
      .systemGreen,
      .systemIndigo,
      .systemMint,
      .systemOrange,
      .systemPink,
      .systemPurple,
      .systemTeal,
      .systemYellow,
      .systemGray,
      .systemGray2,
      .systemGray3,
      .systemGray4,
      .systemGray5,
      .systemGray6
    ]
  }
}
