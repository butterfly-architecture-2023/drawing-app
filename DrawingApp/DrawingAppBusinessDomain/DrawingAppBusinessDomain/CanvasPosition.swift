//
//  CanvasPosition.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/06.
//

import Foundation

public struct CanvasPosition: Equatable {
  static var zero: Self = .init(x: 0, y: 0)
  public static func == (lhs: CanvasPosition, rhs: CanvasPosition) -> Bool {
    lhs.x == rhs.x && lhs.y == rhs.y
  }
  
  @RangeFromZero public var x: Double
  @RangeFromZero public var y: Double
  
  public init(x: Double, y: Double) {
    self.x = x
    self.y = y
  }
  
  init(x: Int, y: Int) {
    self.x = Double(x)
    self.y = Double(y)
  }
}
