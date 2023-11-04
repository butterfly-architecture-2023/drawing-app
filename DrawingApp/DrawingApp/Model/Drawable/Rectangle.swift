//
//  Rectangle.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import Foundation

struct Rectangle: Shape {
    let path: Path
    let fillColor: Color?
    
    var foregroundColor: Color? {
        path.foregroundColor
    }
    
    init(rect: CGRect, borderColor: Color?, fillColor: Color?) {
        let path = Path(rect: rect, foregroundColor: borderColor)
        self.init(
            path: path,
            fillColor: fillColor
        )
    }
    
    init(path: Path, fillColor: Color?) {
        self.path = path
        self.fillColor = fillColor
    }
}
