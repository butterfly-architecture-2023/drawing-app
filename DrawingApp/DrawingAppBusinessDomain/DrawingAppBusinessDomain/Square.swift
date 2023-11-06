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
  private(set) var width: Float = 100
  private(set) var height: Float = 100
  
  // Color(Hex)
  private(set) var hexColor: CanvasRandomColor = .init()
  
  // Position
  var x: Double
  var y: Double
  var position: GesturePosition {
    GesturePosition(x: x, y: y)
  }
  
  init(x: Double, y: Double) {
    self.x = x
    self.y = y
  }
  
  static func random(_ canvas: CanvasSize) -> Square {
    let result = Square(
      x: Double.random(in: 0...(canvas.width - 100)),
      y: Double.random(in: 0...(canvas.height - 100)))
    return result
  }
}
