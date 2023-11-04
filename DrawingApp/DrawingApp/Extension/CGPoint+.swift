//
//  CGPoint+.swift
//  DrawingApp
//
//  Created by elly on 11/4/23.
//

import UIKit

extension CGPoint {
    static func random() -> CGPoint {
        let width = 100
        let height = 100
        let bounds = UIScreen.main.bounds
        let randomX = Int.random(in: 0...(Int(bounds.width)) - width - 16)
        let randomY = Int.random(in: 0...(Int(bounds.height)) - height - 200)
        return CGPoint(x: randomX, y: randomY)
    }
}
