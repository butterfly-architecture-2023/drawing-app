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
  
  func makeChange(_ elem: E, action: Action) -> E {
    switch action {
    case .move:
      return elem
    }
  }
  
  func makeChange(_ id: UUID, action: Action) -> E? {
    let elem = manager.vectors.first(where: {$0.id == id})
    switch action {
    case .move:
      return elem
    }
  }
  
  required init(_ manager: DrawingResourceManager) {
    self.manager = manager
  }
}
