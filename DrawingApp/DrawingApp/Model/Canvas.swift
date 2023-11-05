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
    
    func drawable(point: Point) -> (any Drawable)? {
        elements.values.first { $0.path.contains(point: point) }
    }
    
    func toggle(_ drawable: some Selectable) {
        guard let element = elements[drawable.id] as? (any Selectable) else { return }
        guard element.isSelected else {
            elements.values
                .lazy
                .compactMap { $0 as? (any Selectable) }
                .filter { $0.id != element.id && $0.isSelected }
                .forEach { [weak self] in self?.update($0.deselected()) }
            update(element.selected())
            return
        }
        
        update(element.deselected())
    }
}
