//
//  Square.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/04.
//

import Foundation

/// 사각형을 표현하는데 필요한 모델
public class Square: ElementColorRandom, ElemInView {
  public var id: UUID
  public var order: Int
  
  public var x: Double
  public var y: Double
  
  public var width: Double
  public var height: Double
  
  public var isHighlighted: Bool = false
  // Color(Hex)
  var _color: CanvasColor = .init()
  
  init(
    id: UUID = UUID(),
    order: Int = 0,
    at position: CanvasPosition,
    in size: CanvasSize
  ) {
    self.id = id
    self.order = order
    self.width = size.width
    self.height = size.height
    self.x = position.x
    self.y = position.y
  }
}
