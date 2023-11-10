//
//  ColorPalette.swift
//  SwiftDrawingApp
//
//  Created by Han Songe on 2023/11/09.
//

import UIKit

struct ColorPalette {
    private let colors: [UIColor] = [
        .systemBlue,
        .systemCyan,
        .systemGreen,
        .systemIndigo,
        .systemMint,
        .systemOrange,
        .systemPink,
        .systemPurple,
        .systemTeal,
        .systemYellow
    ]
    
    func randomColor() -> UIColor? {
        colors.randomElement()
    }
}
