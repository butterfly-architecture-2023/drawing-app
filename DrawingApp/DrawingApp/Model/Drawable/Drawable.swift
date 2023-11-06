//
//  Drawable.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import Foundation

protocol Drawable: Identifiable {
    var id: UUID { get }
    var path: Path { get }
    var fillColor: Color? { get }
    var foregroundColor: Color? { get }
}

extension Drawable {
    func contains(point: Point) -> Bool {
        path.contains(point: point)
    }
}
