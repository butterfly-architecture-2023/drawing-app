//
//  DrawingInfo.swift
//  DrawingApp
//
//  Created by elly on 11/4/23.
//

import Foundation

struct DrawingInfo: GraphicsProvider {
    typealias GraphicsType = Drawing
    
    var graphicsInfo: [Drawing] = []
    
    func draw() { }
}
