//
//  CGRect+center.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import Foundation

extension CGRect {
    var center: CGPoint {
        get {
            CGPoint(x: origin.x + width / 2, y: origin.y + height / 2)
        }
        set {
            origin = CGPoint(x: newValue.x - width / 2, y: newValue.y - height / 2)
        }
    }
    
    init(center: CGPoint, size: CGSize) {
        var rect = CGRect(origin: .zero, size: size)
        rect.center = center
        self = rect
    }
}
