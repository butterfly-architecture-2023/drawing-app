//
//  Canvas.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import Foundation

final class Canvas {
    @Published private(set) var elements: [UUID: any Drawable] = [:]
    
    func add(_ drawable: some Drawable) {
        elements[drawable.id] = drawable
    }
}
