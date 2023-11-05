//
//  Canvas.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import Foundation

final class Canvas {
    @Published private(set) var elements: [UUID: any Drawable] = [:]
    
    func update(_ drawable: some Drawable) {
        elements[drawable.id] = drawable
    }
    
    func updatePathPoint(id: UUID, point: Point) {
        var drawable = elements[id] as? (any MutatingDrawable)
        drawable?.add(point)
        elements[id] = drawable
    }
}
