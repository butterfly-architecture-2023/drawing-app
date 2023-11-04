//
//  Shape.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import Foundation

protocol Shape {
    var path: Path { get }
    var foregroundColor: Color? { get }
    var borderColor: Color? { get }
}
