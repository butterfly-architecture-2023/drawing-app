//
//  SquareManager.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/15.
//

import Foundation
import DrawingAppBusinessDomain

class SquareManager: AppElementManager {
  typealias E = Square
  
  var manager: DrawingResourceManager
  
  enum Action: String {
    case highlight, move
  }
  
  func makeChange(_ elem: E, action: Action) -> E {
    switch action {
    case .highlight:
      return elem
    case .move:
      return elem
    }
  }
  
  func makeChange(_ id: UUID, action: Action) -> E? {
    let elem = manager.squares.first(where: {$0.id == id})
    switch action {
    case .highlight:
      return elem
    case .move:
      return elem
    }
  }
  
  required init(_ manager: DrawingResourceManager) {
    self.manager = manager
  }
}
