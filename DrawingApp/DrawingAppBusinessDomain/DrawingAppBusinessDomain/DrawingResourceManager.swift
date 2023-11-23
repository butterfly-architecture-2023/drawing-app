//
//  DrawingResourceManager.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/04.
//

import Foundation

public class DrawingResourceManager {
  public let canvasSize: CanvasSize
  
  public init(_ size: CanvasSize) {
    self.canvasSize = size
  }
  
  public func addSquare() -> Square {
    Square(at: .zero, in: canvasSize)
  }
  
  public func addVector(data: Data?) -> Vector {
    let vector = Vector()
    vector.data = data
    return vector
  }
}
