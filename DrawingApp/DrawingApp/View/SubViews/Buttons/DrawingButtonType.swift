//
//  DrawingButtonType.swift
//  DrawingApp
//
//  Created by elly on 11/4/23.
//

import Foundation

enum DrawingButtonType {
    case rectangle
    case drawing
    
    func info() -> (title: String, imageName: String) {
        switch self {
            
        case .rectangle:
            return (title: "사각형", imageName: "rectangle_icon")
        case .drawing:
            return (title: "드로잉", imageName: "drawing_icon")
        }
    }
}
