//
//  MutatingDrawable.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/05.
//

import Foundation

protocol MutatingDrawable: Drawable {
    mutating func add(_ point: Point)
}
