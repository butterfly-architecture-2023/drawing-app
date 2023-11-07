//
//  Shape.swift
//  Drawing
//
//  Created by 우리캐피탈 on 2023/11/07.
//

import UIKit

struct Shape: Equatable {
    let id: String
    let type: ShapeType
    var color: UIColor
    var frame: CGRect
}

func ==(lhs: Shape, rhs: Shape) -> Bool {
    return lhs.id == rhs.id
}

enum ShapeType {
    case rectangle
    case drawing
}
