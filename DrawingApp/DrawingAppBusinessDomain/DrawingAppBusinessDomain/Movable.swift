//
//  Movable.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/13.
//

import Foundation

protocol Movable {
  var _canvasFrame: CanvasFrame { get set }
}

extension Movable {
  var current: CanvasPosition {
    _canvasFrame.position
  }
  var downRight: CanvasPosition {
    .init(x: _canvasFrame.size.width, y: _canvasFrame.size.height)
  }
  var upLeft: CanvasPosition {
    .init(x: _canvasFrame.position.x, y: _canvasFrame.position.y)
  }
  mutating func move(at position: CanvasPosition) -> Bool {
    guard position.x < (downRight.x+1) && position.y < (downRight.y+1) else {
      return false
    }
    
    self._canvasFrame.position = position
    return true
  }
}
