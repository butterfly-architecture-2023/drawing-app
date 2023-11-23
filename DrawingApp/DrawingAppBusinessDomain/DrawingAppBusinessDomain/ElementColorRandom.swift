//
//  ElementColorRandom.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/13.
//

import Foundation

protocol ElementColorRandom {
  var _color: CanvasColor { get set }
}

extension ElementColorRandom {
  var color: CanvasColor {
    _color
  }
  var colorSet: (red: Double, green: Double, blue: Double) {
    (_color.colorSet.red, _color.colorSet.green, _color.colorSet.blue)
  }
  mutating func random() {
    _color = .init()
  }
}
