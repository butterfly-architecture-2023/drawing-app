//
//  Square.swift
//  Rectangle
//
//  Created by 오킹 on 2023/11/08.
//

import Foundation

struct Rectangle {
    let backgroundColor: Color
    let rect: CGRect
    
    init(rect: CGRect, backgroundColor: Color) {
        self.rect = rect
        self.backgroundColor = backgroundColor
    }
}
