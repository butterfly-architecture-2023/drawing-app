//
//  Rectangle.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import Foundation

struct Rectangle: Shape, Selectable {
    let id: UUID
    private(set) var isSelected: Bool = false {
        didSet {
            foregroundColor = isSelected ? Color.systemRed : nil
        }
    }
    
    private(set) var path: Path
    let fillColor: Color?
    
    var foregroundColor: Color? {
        get {
            path.foregroundColor
        }
        set {
            path.foregroundColor = newValue
        }
    }
    
    init(rect: CGRect, borderColor: Color?, fillColor: Color?) {
        let path = Path(rect: rect, foregroundColor: borderColor)
        self.init(
            path: path,
            fillColor: fillColor
        )
    }
    
    init(id: UUID = UUID(), path: Path, fillColor: Color?) {
        self.id = id
        self.path = path
        self.fillColor = fillColor
    }
    
    func copy() -> Self {
        Rectangle(id: id, path: path, fillColor: fillColor)
    }
    
    func selected() -> Self {
        var rectangle = copy()
        rectangle.isSelected = true
        return rectangle
    }
    
    func deselected() -> Self {
        var rectangle = copy()
        rectangle.isSelected = false
        return rectangle
    }
}
