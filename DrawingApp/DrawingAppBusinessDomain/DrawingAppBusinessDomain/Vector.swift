//
//  Vector.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/04.
//

import Foundation

/// 자유로운 선을 표현하는데 필요한 뷰의 모델
public class Vector: ElemInView {
  public var id: UUID
  public var order: Int
  
  // Color(Hex)
  private(set) var _hexColor: CanvasColor = .init()
  public var hexColor: CanvasColor {
    _hexColor
  }
  
  // Size
  public var width: Double = 0
  public var height: Double = 0
  
  // Position
  public var x: Double = 0
  public var y: Double = 0
  
  init(id: UUID = UUID(), order: Int = 0) {
    self.id = id
    self.order = order
  }
  
  public var data: Data?
}
