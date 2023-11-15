//
//  VectorFactory.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/15.
//

import Foundation
import DrawingAppBusinessDomain

class VectorFactory: AppFactory {
  typealias E = Vector
  typealias P = Data
  internal var manager: DrawingResourceManager
  var elements: [E] {
    manager.vectors
  }
  
  func makeElements() -> E {
    manager.addVector(data: nil)
  }
  
  func makeElements(_ p: P) -> Vector {
    manager.addVector(data: p)
  }
  
  required init(_ manager: DrawingResourceManager) {
    self.manager = manager
  }
}
