//
//  Square.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import Foundation

struct Position: Hashable {
    var x, y: CGFloat
}

struct Square {
    var id: Int
    var color: ColorType
    var position: Position
    var isSelected: Bool = false

    init(id: Int, color: ColorType, position: Position) {
        self.id = id
        self.color = color
        self.position = position
    }
}

extension Square: Equatable {
    static func == (lhs: Square, rhs: Square) -> Bool {
        return lhs.id == rhs.id &&
        lhs.color == rhs.color &&
        lhs.isSelected == rhs.isSelected
    }
}
