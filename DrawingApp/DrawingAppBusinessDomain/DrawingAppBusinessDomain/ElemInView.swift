//
//  ElemInView.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/14.
//

import Foundation

public protocol ElemInView {
  var id: UUID { get }
  var order: Int { get set }
  
  var x: Double { get set }
  var y: Double { get set }
  var width: Double { get set }
  var height: Double { get set }
}

extension ElemInView {
  public var position: CanvasPosition {
    CanvasPosition(x: x, y: y)
  }
  public var size: CanvasSize {
    CanvasSize(width: width, height: height)
  }
  public var frame: CanvasFrame {
    CanvasFrame(size, position)
  }
  
  public mutating func setSize(_ size: CanvasSize) {
    self.width = size.width
    self.height = size.height
  }
  
  public mutating func setSize(_ width: Double, _ height: Double) {
    self.width = width
    self.height = height
  }
  
  public mutating func setPosition(_ position: CanvasPosition) {
    self.x = position.x
    self.y = position.y
  }
  
  public mutating func setPosition(_ x: Double, _ y: Double) {
    self.x = x
    self.y = y
  }
}
