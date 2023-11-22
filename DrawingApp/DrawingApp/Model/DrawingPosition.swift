//
//  DrawingPosition.swift
//  DrawingApp
//
//  Created by elly on 11/23/23.
//

import Foundation

struct DrawingPosition: PositionProtocol {
    var id: UUID = UUID()
    var points: [CGPoint] = []
}
