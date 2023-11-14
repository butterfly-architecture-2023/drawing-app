//
//  Square.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/04.
//

import Foundation

/// 사각형을 표현하는데 필요한 모델
public class Square: Movable, ElementColorRandom {
  // Color(Hex)
  var _color: CanvasColor = .init()
  var _canvasFrame: CanvasFrame
  public var color: CanvasColor {
    _color
  }
  public var colorSet: (red: Double, green: Double, blue: Double, alpha: Double) {
    _color.colorSet
  }
  public var size: CanvasSize {
    _canvasFrame.size
  }
  public var position: CanvasPosition {
    _canvasFrame.position
  }
  
  init(at position: CanvasPosition, in size: CanvasSize) {
    self._canvasFrame = .init(
      size: size,
      position: position)
  }
  
  public func setPosition(at position: CanvasPosition) {
    _canvasFrame.position = position
  }
  
  public func randomPosition(_ canvas: CanvasSize) {
    _canvasFrame.convertToRandomPosition()
  }
}
