//
//  DrawingType.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/06.
//

import UIKit

enum DrawingType {
    case square, drawing
    
    var title: String {
        switch self {
        case .square:
            return "사각형"
        case .drawing:
            return "드로잉"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .square:
            return .icon_square
        case .drawing:
            return .icon_drawing
        }
    }
}
