//
//  Rectangle.swift
//  DrawingApp
//
//  Created by Dongyoung Kwon on 2023/11/06.
//

import Foundation

struct Rectangle: Identifiable {
    var id = UUID()
    
    let rect: CGRect
    let backgroundColor: SystemColor
    var isSelected: Bool
}
