//
//  DrawingInfo.swift
//  DrawingApp
//
//  Created by elly on 11/4/23.
//

import Foundation

protocol GraphicsProvider {
    associatedtype GraphicsType
    var graphicsInfo: [GraphicsType] { get set }
    func draw()
}

struct DrawingInfo: GraphicsProvider {
    typealias GraphicsType = Drawing
    
    var graphicsInfo: [Drawing] = []
    
    func draw() { }
}
