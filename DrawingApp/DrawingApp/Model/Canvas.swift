//
//  Canvas.swift
//  DrawingApp
//
//  Created by 오킹 on 2023/11/08.
//

import Foundation

final class Canvas {
    private(set) var shapes: [Rectangle] = []
    
    func add(rectangle: Rectangle) {
        shapes.append(rectangle)
    }
}
