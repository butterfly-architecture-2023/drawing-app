//
//  Shape.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import Foundation

protocol Shape: Drawable {
    var fillColor: Color? { get }
}
