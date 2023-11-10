//
//  DrawingInfo.swift
//  DrawingApp
//
//  Created by elly on 11/4/23.
//

import UIKit

struct DrawingInfo {
    var id: UUID
    var width: CGFloat
    var color: UIColor
    var point: CGPoint
    
    init(width: CGFloat = 2.0, color: UIColor = .black, point: CGPoint = CGPoint()) {
        self.id = UUID()
        self.width = width
        self.color = color
        self.point = point
    }
}
