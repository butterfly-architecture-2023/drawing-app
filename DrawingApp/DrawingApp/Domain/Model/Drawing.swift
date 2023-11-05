//
//  Drawing.swift
//  DrawingApp
//
//  Created by 강호성 on 11/5/23.
//

import Foundation

struct Drawing {
    var id: Int
    var color: ColorType
    var coordinates: [CGPoint] = []

    init(id: Int, color: ColorType, coordinates: [CGPoint]) {
        self.id = id
        self.color = color
        self.coordinates = coordinates
    }
}
