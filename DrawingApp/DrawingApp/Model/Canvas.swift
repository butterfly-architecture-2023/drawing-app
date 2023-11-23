//
//  Canvas.swift
//  DrawingApp
//
//  Created by 오킹 on 2023/11/08.
//

import Foundation

final class Canvas {
    private(set) var rectangles: [Rectangle] = []
    private(set) var drawings: [Drawing] = []
    private(set) var selectedRectangles: [UUID: Rectangle] = [:]
    
    func add(rectangle: Rectangle) {
        self.rectangles.append(rectangle)
    }
    
    func add(drawing: Drawing) {
        self.drawings.append(drawing)
    }
    
    func select(rectangle: Rectangle) {
        self.selectedRectangles[rectangle.id] = rectangle
    }
    
    func deselect(rectangle: Rectangle) {
        self.selectedRectangles[rectangle.id] = nil
    }
}
