//
//  Selectable.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/05.
//

import Foundation

protocol Selectable: Drawable {
    var isSelected: Bool { get }
    
    func selected() -> Self
    func deselected() -> Self
}
