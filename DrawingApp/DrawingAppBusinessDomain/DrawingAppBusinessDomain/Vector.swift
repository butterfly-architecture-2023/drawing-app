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
  private(set) var hexColor: CanvasRandomColor = .init()
  
  // Size
  private(set) var width: Double = 100
  private(set) var height: Double = 100
  public var canvasSize: CanvasSize {
    CanvasSize(width: width, height: height)
  }
  
  // Position
  var x: Double
  var y: Double
  public var position: GesturePosition {
    GesturePosition(x: x, y: y)
  }
  
  init(x: Double, y: Double) {
    self.x = x
    self.y = y
  }
  
  public var data: Data?
}
