//
//  CanvasSize.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/05.
//

import Foundation

public struct CanvasSize {
  @RangeFromZero public var width: Double
  @RangeFromZero public var height: Double
  
  public init(width: Double, height: Double) {
    self.width = width
    self.height = height
  }
}
