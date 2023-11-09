//
//  RectangleView.swift
//  DrawingApp
//
//  Created by 안상희 on 11/9/23.
//

import UIKit

protocol RectangleViewDelegate: AnyObject {
  func rectangleDidTapped(_ id: UUID)
}

final class RectangleView: UIView {
  private let rectangle: Rectangle
  
  weak var delegate: RectangleViewDelegate?
  
  init(rectangle: Rectangle) {
    self.rectangle = rectangle
    super.init(frame: .zero)
    self.backgroundColor = rectangle.color
  }
  
  required init?(coder: NSCoder) {
    self.rectangle = Rectangle(color: .systemRandomColor, id: .init(), point: .init(x: 0.0, y: 0.0))
    
    super.init(coder: coder)
  }
}
