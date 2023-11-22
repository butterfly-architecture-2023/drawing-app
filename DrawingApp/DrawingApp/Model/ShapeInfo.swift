//
//  ShapeInfo.swift
//  DrawingApp
//
//  Created by elly on 11/4/23.
//

import Foundation

struct ShapeInfo: GraphicsProvider {
    typealias GraphicsType = Rectangle
    
    var graphicsInfo: [Rectangle] = []
    
    func draw() { }
}
