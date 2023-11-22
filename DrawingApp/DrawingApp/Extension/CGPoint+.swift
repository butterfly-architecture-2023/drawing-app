//
//  CGPoint+.swift
//  DrawingApp
//
//  Created by elly on 11/4/23.
//

import Foundation

extension CGPoint {
    static func random(in bounds: CGRect) -> CGPoint {
        let width = 100
        let height = 100
        let randomX = Int.random(in: 0...(Int(bounds.width)) - width - 16)
        let randomY = Int.random(in: 0...(Int(bounds.height)) - height - 200)
        return CGPoint(x: randomX, y: randomY)
    }
}
