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
    addSubview(rectangleView)
  }
}
