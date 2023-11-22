//
//  Rectangle.swift
//  DrawingApp
//
//  Created by elly on 11/23/23.
//

import Foundation
import CoreGraphics

struct Rectangle: RectangleProtocol {
    var id: UUID = UUID()
    var color: CGColor = .black
    var points: [CGPoint] = []
    var isSelected: Bool = false

    func topLeftPoint() -> CGPoint {
        return points.first ?? CGPoint(x: 0, y: 0)
    }
}
