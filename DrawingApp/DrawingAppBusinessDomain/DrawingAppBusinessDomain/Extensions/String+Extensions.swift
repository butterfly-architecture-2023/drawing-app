//
//  String+Extensions.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/05.
//

import Foundation

extension String {
  static var coupledHex: String {
    Array(repeating: [String].hexElements.randomElement() ?? "0", count: 2).reduce("", +)
  }
  
  public var hexColor: String {
    self + .coupledHex + .coupledHex + .coupledHex
  }
}
