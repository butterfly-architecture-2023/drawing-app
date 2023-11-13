//
//  Layout.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/08.
//

import Foundation

enum Layout {
    
    case square, buttonWidth, buttonHeigth
    
    var size: CGFloat {
        switch self {
        case .square:
            return 100
        case .buttonWidth:
            return 180
        case .buttonHeigth:
            return 50
        }
    }
    
}
