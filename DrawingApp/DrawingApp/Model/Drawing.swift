//
//  Drawing.swift
//  DrawingApp
//
//  Created by 오킹 on 2023/11/09.
//

import Foundation

struct Drawing {
    let id = UUID()
    let points: [CGPoint]
    var lineWidth: CGFloat
}
