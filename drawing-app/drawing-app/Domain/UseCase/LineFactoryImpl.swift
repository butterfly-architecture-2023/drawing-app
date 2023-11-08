//
//  LineFactoryImpl.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/09.
//

import Foundation

class LineFactoryImpl: LineFactory {
        
    init() { }
    
    func startDraw(in point: CGPoint) -> Line? {
        return .init(startPoint: point)
    }
}
