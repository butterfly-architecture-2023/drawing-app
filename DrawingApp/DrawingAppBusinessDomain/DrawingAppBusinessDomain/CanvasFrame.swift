//
//  CanvasFrame.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/14.
//

import Foundation

public struct CanvasFrame {
  var _size: CanvasSize
  public var size: CanvasSize {
    _size
  }
  var _position: CanvasPosition
  public var position: CanvasPosition {
    _position
  }
  
  public init(_ size: CanvasSize, _ position: CanvasPosition) {
    self._size = size
    self._position = position
  }
  
  public mutating func convertToRandomPosition() {
    _position.x = Double.random(in: position.x...position.x+size.width)
    _position.y = Double.random(in: position.y...position.y+size.height)
  }
}
