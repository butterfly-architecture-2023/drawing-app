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
  
  public init() {
    
  }
  
  func addSquare() -> Square {
    let square = Square()
    self.squares.append(square)
    return square
  }
  
  func addVector() -> Vector {
    let vector = Vector()
    self.vectors.append(vector)
    return vector
  }
}
