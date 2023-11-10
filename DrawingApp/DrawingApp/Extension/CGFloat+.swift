//
//  CGFloat+.swift
//  DrawingApp
//
//  Created by 김도형 on 2023/11/09.
//

import Foundation

extension CGFloat {
    
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    
}
