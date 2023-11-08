//
//  CanvasSize+Extensions.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/09.
//

import UIKit
import DrawingAppBusinessDomain

extension CanvasSize {
  func toCGSize() -> CGSize {
    CGSize(width: width, height: height)
  }
}
