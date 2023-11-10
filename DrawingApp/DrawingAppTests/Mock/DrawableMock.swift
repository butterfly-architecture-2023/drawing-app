//
//  DrawableMock.swift
//  DrawingAppTests
//
//  Created by 현기엽 on 2023/11/06.
//

import Foundation
@testable import DrawingApp

final class DrawableMock: Selectable {
    let id: UUID
    let path: Path
    let fillColor: Color?
    let foregroundColor: Color?
    var isSelected: Bool
    
    init(
        id: UUID = UUID(),
        path: Path = .init(points: [], foregroundColor: nil),
        fillColor: Color? = nil,
        foregroundColor: Color? = nil,
        isSelected: Bool = false
    ) {
        self.id = id
        self.path = path
        self.fillColor = fillColor
        self.foregroundColor = foregroundColor
        self.isSelected = isSelected
    }
    
    func selected() -> Self {
        isSelected = true
        return self
    }
    
    func deselected() -> Self {
        isSelected = false
        return self
    }
}
