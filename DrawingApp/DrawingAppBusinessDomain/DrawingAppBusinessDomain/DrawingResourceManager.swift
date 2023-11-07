//
//  DrawingResourceManager.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/04.
//

import Foundation

public class DrawingResourceManager {
  public var squares = [Square]()
  public var vectors = [Vector]()
  public let canvasSize: CanvasSize
  
  public init(_ size: CanvasSize) {
    self.canvasSize = size
  }
  
  public func addSquare() -> Square {
    let square = Square.random(canvasSize)
    self.squares.append(square)
    return square
  }
  
  public func addVector(from position: GesturePosition) -> Vector {
    let vector = Vector(x: position.x, y: position.y)
    self.vectors.append(vector)
    return vector
  }
  
  public func moveSquare(_ square: Square, at position: GesturePosition) -> Bool {
    guard let square = squares.first(where: {ObjectIdentifier($0) == ObjectIdentifier(square)}) else {
      return false
    }
    
    square.setPosition(at: position)
    return true
  }
  
  public func setVector(data: Data) -> Bool {
    guard let vector = vectors.first(where: {$0.data == nil}) else {
      return false
    }
    
    vector.data = data
    return true
  }
}
