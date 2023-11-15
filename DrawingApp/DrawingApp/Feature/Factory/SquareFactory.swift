//
//  SquareFactory.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/15.
//

import Foundation
import DrawingAppBusinessDomain

class SquareFactory: AppFactory {
  typealias E = Square
  typealias P = Void
  internal var manager: DrawingResourceManager
  var elements: [E] {
    manager.squares
  }
  
  func makeElements() -> E {
    manager.addSquare()
  }
  
  func makeElements(_ p: P) -> Square {
    manager.addSquare()
  }
  
  required init(_ manager: DrawingResourceManager) {
    self.manager = manager
  }
}
