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
    var foregroundColor: Color? { get }
}
