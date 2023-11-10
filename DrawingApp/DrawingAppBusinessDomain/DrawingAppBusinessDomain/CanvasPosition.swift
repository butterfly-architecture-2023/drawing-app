//
//  CanvasPosition.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/06.
//

import Foundation

public struct CanvasPosition: Equatable {
  public let x: Double
  public let y: Double
  
  public init(x: Double, y: Double) {
    self.x = x
    self.y = y
  }
}
