//
//  CanvasFrame.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/14.
//

import Foundation

struct CanvasFrame {
  var size: CanvasSize
  var position: CanvasPosition
  
  mutating func convertToRandomPosition() {
    position.x = Double.random(in: position.x...position.x+size.width)
    position.y = Double.random(in: position.y...position.y+size.height)
  }
}
