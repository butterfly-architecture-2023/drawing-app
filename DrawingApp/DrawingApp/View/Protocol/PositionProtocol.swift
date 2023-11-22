//
//  PositionProtocol.swift
//  DrawingApp
//
//  Created by elly on 11/20/23.
//

import Foundation

protocol PositionProtocol: Identifiable, Pointable { }

struct RectanglePosition: PositionProtocol {
    var id: UUID = UUID()
    var points: [CGPoint] = []
}

struct DrawingPosition: PositionProtocol {
    var id: UUID = UUID()
    var points: [CGPoint] = []
}
