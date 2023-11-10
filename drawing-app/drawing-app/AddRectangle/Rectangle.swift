//
//  Rectangle.swift
//  drawing-app
//
//  Created by 박진섭 on 11/4/23.
//

struct Rectangle: Hashable {
    static func == (lhs: Rectangle, rhs: Rectangle) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    let width: Double
    let height: Double
    let x: Double
    let y: Double
    var style: RectangleStyle
}

struct RectangleStyle: Hashable {
    let backgroundRGBA: RGBA
    let borderRGBA: RGBA?
    let borderWidth: Double?
}

struct RGBA: Hashable {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
}

