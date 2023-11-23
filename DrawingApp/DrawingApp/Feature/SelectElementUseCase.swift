//
//  SelectElementUseCase.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/21.
//

import Foundation
import DrawingAppBusinessDomain

/// Entity
class SelectSquareElementUseCase {
  func tapped(_ square: Square) {
    setHighlight(square)
  }
  
  func setHighlight(_ square: Square) {
    
  }
  
  func move(_ square: Square, to point: CanvasPosition) {
    
  }
}
