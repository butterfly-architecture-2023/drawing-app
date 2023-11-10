//
//  RectangleFactory.swift
//  DrawingApp
//
//  Created by 안상희 on 11/7/23.
//

import Foundation

struct RectangleFactory {
  func create(_ boundary: Boundary) -> Rectangle {
    return Rectangle(color: .systemRandomColor, id: UUID(), point: createRandomPoint(boundary))
  }
  
  private func createRandomPoint(_ boundary: Boundary) -> Point {
    let maxPoint = createMaxPoint(boundary)
    let maxX = maxPoint.x
    let maxY = maxPoint.y
    return Point(x: Double.random(in: 0...maxX), y: Double.random(in: 0...maxY))
  }
  
  private func createMaxPoint(_ boundary: Boundary) -> Point {
    let size = 100.0
    let x = boundary.x - size
    let y = boundary.y - size
    return Point(x: x, y: y)
  }
}
