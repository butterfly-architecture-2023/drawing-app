//
//  CanvasView.swift
//  DrawingApp
//
//  Created by 안상희 on 11/8/23.
//

import UIKit

final class CanvasView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  func append(rectangle: Rectangle) {
    let rectangleView = RectangleView(rectangle: rectangle)
    rectangleView.frame = CGRect(x: rectangle.point.x, y: rectangle.point.y, width: 100, height: 100)
    addSubview(rectangleView)
  }
}
