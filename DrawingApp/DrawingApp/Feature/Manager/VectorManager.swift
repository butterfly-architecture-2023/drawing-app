//
//  VectorManager.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/15.
//

import Foundation
import DrawingAppBusinessDomain

class VectorManager: AppElementManager {
  typealias E = Vector
  
  var manager: DrawingResourceManager
  
  enum Action: String {
    case move
  }
  
  func makeChange(_ elem: E) -> E {
    return elem
  }
  
  required init(_ manager: DrawingResourceManager) {
    self.manager = manager
  }
}
