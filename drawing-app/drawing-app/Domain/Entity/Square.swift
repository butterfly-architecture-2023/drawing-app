//
//  Square.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/07.
//

import Foundation

struct Square {
    
    // MARK: - Property
    
    let id: UUID
    let size: CGSize
    let color: SystemColor
    let point: Point
    let rect: CGRect
    
    // MARK: - Initializer
    
    init(id: UUID = .init(),
         size: CGSize = .init(width: Layout.square.size, height: Layout.square.size),
         point: Point,
         color: SystemColor
    ) {
        self.id = id
        self.size = size
        self.color = color
        self.point = point
        self.rect = .init(x: point.x, y: point.y, width: size.width, height: size.height)
    }
    
}

extension Square: Equatable, Hashable {
    static func == (lhs: Square, rhs: Square) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
