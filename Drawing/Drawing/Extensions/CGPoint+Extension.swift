//
//  CGPoint+Extension.swift
//  Drawing
//
//  Created by ByungHoon Ann on 2023/11/16.
//

import UIKit

extension CGPoint {
    var drawPoint: DrawPoint {
        return DrawPoint(x: Float(x), y: Float(y))
    }
}
