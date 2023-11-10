//
//  Square.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/04.
//

import Foundation

/// 사각형을 표현하는데 필요한 모델
public class Square {
  // Size
  private(set) var width: Double = 100
  private(set) var height: Double = 100
  public var canvasSize: CanvasSize {
    CanvasSize(width: width, height: height)
  }
  
  // Color(Hex)
  private(set) var hexColor: CanvasRandomColor = .init()
  public var colorSet: (red: Double, green: Double, blue: Double) {
    (hexColor.colorSet.red, hexColor.colorSet.green, hexColor.colorSet.blue)
  }
  
  // Position
  private(set) var x: Double
  private(set) var y: Double
  public var position: GesturePosition {
    GesturePosition(x: x, y: y)
  }
  
  init(x: Double, y: Double) {
    self.x = x
    self.y = y
  }
  
  public func setPosition(at position: GesturePosition) {
    x = position.x
    y = position.y
  }
  
  static func random(_ canvas: CanvasSize) -> Square {
    let result = Square(x: 0, y: 0)
    result.setPosition(at: GesturePosition(
      x: Double.random(in: 0...(canvas.width - result.width)),
      y: Double.random(in: 0...(canvas.height - result.height))))
    return result
  }
  
  public func random(_ canvas: CanvasSize) {
    x = Double.random(in: 0...(canvas.width - width))
    y = Double.random(in: 0...(canvas.height - height))
  }
}
