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
  
  public func addVector(data: Data?) -> Vector {
    let vector = Vector()
    vector.data = data
    self.vectors.append(vector)
    return vector
  }
  
  public func move(square: Square, at position: CanvasPosition) -> Bool {
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
  
  public func move(vector: Vector, at position: CanvasPosition) -> Bool {
    guard let vector = vectors.first(where: {ObjectIdentifier($0) == ObjectIdentifier(vector)}) else {
      return false
    }
    
    vector.setPosition(at: position)
    return true
  }
}
