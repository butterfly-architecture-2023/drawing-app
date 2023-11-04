//
//  Square.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import Foundation

struct Square {
    var id: Int
    var color: ColorType
    var isSelected: Bool = false

    init(id: Int, color: ColorType) {
        self.id = id
        self.color = color
    }
}
