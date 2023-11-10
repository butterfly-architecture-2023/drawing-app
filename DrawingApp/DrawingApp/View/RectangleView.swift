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
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    self.rectangle = Rectangle(color: .systemRandomColor, id: .init(), point: .init(x: 0.0, y: 0.0))
    
    super.init(coder: coder)
  }
  
  private func setLayout() {
    let size = 100.0
    self.frame = CGRect(x: rectangle.point.x, y: rectangle.point.y, width: 100, height: 100)
    self.backgroundColor = rectangle.color
  }
}
