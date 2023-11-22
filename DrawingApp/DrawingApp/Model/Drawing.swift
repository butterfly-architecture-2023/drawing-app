//
//  Drawing.swift
//  DrawingApp
//
//  Created by elly on 11/23/23.
//

import Foundation
import CoreGraphics

struct Drawing: DrawingProtocol {
    var id: UUID = UUID()
    var color: CGColor = .black
    var points: [CGPoint] = []
}
