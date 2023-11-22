//
//  ViewFactory.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/22.
//

import Foundation
import DrawingAppBusinessDomain

/// Entity
class ViewFactory: ObservableObject {
  @Published var squares: [Square] = []
  @Published var vectors: [Vector] = []
  
  private var manager: DrawingResourceManager
  
  init(_ manager: DrawingResourceManager) {
    self.manager = manager
  }
  
  func makeElement() -> Square {
    let square = manager.addSquare()
    squares.append(square)
    return square
  }
  
  func makeElement(data: Data) -> Vector {
    let vector = manager.addVector(data: data)
    vectors.append(vector)
    return vector
  }
  
  func getElements(at point: CanvasPosition) -> [any ElemInView] {
    var result: [any ElemInView] = squares.filter { e in
      return e.position.x..<e.position.x+e.size.width ~= point.x
      && e.position.y..<e.position.y+e.size.height ~= point.y
    }
    result += vectors.filter { e in
      return e.position.x..<e.position.x+e.size.width ~= point.x
      && e.position.y..<e.position.y+e.size.height ~= point.y
    }
    
    return result
  }
}
