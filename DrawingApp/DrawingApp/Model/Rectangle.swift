//
//  Square.swift
//  Rectangle
//
//  Created by 오킹 on 2023/11/08.
//

import Foundation

struct Rectangle {
    let id = UUID()
    let backgroundColor: Color
    let rect: CGRect
    static let width: CGFloat = 100.0
    static let height: CGFloat = 100.0
    
    init(rect: CGRect, backgroundColor: Color) {
        self.rect = rect
        self.backgroundColor = backgroundColor
    }
}
