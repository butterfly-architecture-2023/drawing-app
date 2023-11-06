//
//  DrawingResourceManager.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/04.
//

import Foundation

public class DrawingResourceManager {
  private(set) var squares = [Square]()
  private(set) var vectors = [Vector]()
  private let canvasSize: CanvasSize
  
  public init(_ size: CanvasSize) {
    self.canvasSize = size
  }
  
  func addSquare() -> Square {
    let square = Square.random(canvasSize)
    self.squares.append(square)
    return square
  }
  
  func addVector() -> Vector {
    let vector = Vector()
    self.vectors.append(vector)
    return vector
  }
  
  func moveSquare(_ square: Square, at position: GesturePosition) -> Bool {
    guard let square = squares.first(where: {ObjectIdentifier($0) == ObjectIdentifier(square)}) else {
      return false
    }
    
    square.x = position.x
    square.y = position.y
    return true
  }
  
  func setVector(data: Data) -> Bool {
    guard let vector = vectors.first(where: {$0.data == nil}) else {
      return false
    }
    
    vector.data = data
    return true
  }
}
