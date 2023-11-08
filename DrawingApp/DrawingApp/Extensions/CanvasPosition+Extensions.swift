//
//  CanvasPosition.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/09.
//

import UIKit
import DrawingAppBusinessDomain

extension CanvasPosition {
  func toCGPoint() -> CGPoint {
    CGPoint(x: x, y: y)
  }
}
