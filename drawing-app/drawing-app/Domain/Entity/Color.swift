//
//  Color.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/07.
//

import UIKit

enum Color {
    static func getRandomColor() -> UIColor {
        let systemColor: [UIColor] = [.systemBlue, .systemCyan, .systemMint, .systemPink, .systemTeal, .systemBrown, .systemIndigo, .systemOrange, .systemPurple, .systemYellow]
        return systemColor.randomElement() ?? .systemBlue
    }
    
    static func getBorderColor() -> UIColor {
        .systemRed
    }
}
