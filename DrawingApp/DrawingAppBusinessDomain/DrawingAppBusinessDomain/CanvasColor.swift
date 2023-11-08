//
//  CanvasColor.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/06.
//

import Foundation

public struct CanvasColor: Equatable {
  private let prefixString = String.coupledHex
  private let infixString = String.coupledHex
  private let postfixString = String.coupledHex
  
  /// hex
  private var colorString: String {
    prefixString + infixString + postfixString
  }
  
  /// rgb
  public var colorSet: (red: Double, green: Double, blue: Double, alpha: Double) {
    var rgbValue: UInt64 = 0
    Scanner(string: colorString).scanHexInt64(&rgbValue)
    return (
      red: Double((rgbValue & 0xFF0000) >> 16) / 255.0,
      green: Double((rgbValue & 0x00FF00) >> 8) / 255.0,
      blue: Double((rgbValue & 0x0000FF) >> 0) / 255.0,
      alpha: 1.0
    )
  }
}
