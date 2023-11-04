//
//  Drawable.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import Foundation

protocol Drawable {
    var path: Path { get }
    var foregroundColor: Color? { get }
}
