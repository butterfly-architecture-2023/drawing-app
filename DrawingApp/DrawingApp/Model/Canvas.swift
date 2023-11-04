//
//  Canvas.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import Foundation

protocol CanvasDelegate: AnyObject {
    func didElementsChanged(canvas: Canvas, elements: [UUID: any Drawable])
}

struct Canvas {
    private var elements: [UUID: any Drawable] {
        didSet {
            delegate?.didElementsChanged(canvas: self, elements: elements)
        }
    }
    
    weak var delegate: CanvasDelegate?
    
    mutating func add(_ drawable: some Drawable) {
        elements[drawable.id] = drawable
    }
}
