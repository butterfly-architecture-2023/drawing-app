//
//  Rectangle.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import Foundation

struct Rectangle: Shape {
    let path: Path
    let foregroundColor: Color?
    let borderColor: Color?
    
    init(rect: CGRect, foregroundColor: Color?, borderColor: Color?) {
        let path = Path(rect: rect)
        self.init(
            path: path,
            foregroundColor: foregroundColor,
            borderColor: borderColor
        )
    }
    
    init(path: Path, foregroundColor: Color?, borderColor: Color?) {
        self.path = path
        self.foregroundColor = foregroundColor
        self.borderColor = borderColor
    }
}
