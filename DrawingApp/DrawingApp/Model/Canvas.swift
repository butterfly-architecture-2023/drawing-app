//
//  Canvas.swift
//  DrawingApp
//
//  Created by 오킹 on 2023/11/08.
//

import Foundation

final class Canvas {
    private(set) var shapes: [Rectangle] = []
    private(set) var drawings: [Drawing] = []
    
    func add(rectangle: Rectangle) {
        shapes.append(rectangle)
    }
    
    func add(drawing: Drawing) {
        drawings.append(drawing)
    }
}
