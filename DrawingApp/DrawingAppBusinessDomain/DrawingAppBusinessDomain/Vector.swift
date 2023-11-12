//
//  Vector.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/04.
//

import Foundation

/// 자유로운 선을 표현하는데 필요한 뷰의 모델
public class Vector {
  
  // Color(Hex)
  private(set) var _hexColor: CanvasColor = .init()
  public var hexColor: CanvasColor {
    _hexColor
  }
  
  // Size
  private(set) var width: Double = 100
  private(set) var height: Double = 100
  public var canvasSize: CanvasSize {
    CanvasSize(width: width, height: height)
  }
  public func setSize(width: Double, height: Double) {
    self.width = width
    self.height = height
  }
  
  // Position
  private(set) var x: Double = 0
  private(set) var y: Double = 0
  public var position: CanvasPosition {
    CanvasPosition(x: x, y: y)
  }
  public func setPosition(x: Double, y: Double) {
    self.x = x
    self.y = y
  }
  public func setPosition(at position: CanvasPosition) {
    self.x = position.x
    self.y = position.y
  }
  
  
  public var data: Data?
}
