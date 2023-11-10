//
//  LineManagerImpl.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/09.
//

import Foundation

class LineManagerImpl: LineManager {
        
    init() { }
    
    func startDraw(in point: CGPoint) -> Line? {
        return .init(startPoint: point)
    }
}
