//
//  SystemColor.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/07.
//

import UIKit

enum SystemColor: CaseIterable {
    
    case systemBlue, systemBrown, systemGreen, systemIndigo, systemOrange, systemPink, systemPurple, systemTeal, systemYellow, systemGray
    case black, blue, brown, cyan, darkGray, gray, green, lightGray, magenta, purple, red, yellow
    case random
    
    var uicolor: UIColor {
        switch self {
        case .systemBlue:
            return .systemBlue
        case .systemBrown:
            return .systemBrown
        case .systemGreen:
            return .systemGreen
        case .systemIndigo:
            return .systemIndigo
        case .systemOrange:
            return .systemOrange
        case .systemPink:
            return .systemPink
        case .systemPurple:
            return .systemPink
        case .systemTeal:
            return .systemTeal
        case .systemYellow:
            return .systemYellow
        case .systemGray:
            return .systemGray
        case .black:
            return .black
        case .blue:
            return .blue
        case .brown:
            return .brown
        case .cyan:
            return .cyan
        case .darkGray:
            return .darkGray
        case .gray:
            return .gray
        case .green:
            return .green
        case .lightGray:
            return .lightGray
        case .magenta:
            return .magenta
        case .purple:
            return .purple
        case .red:
            return .red
        case .yellow:
            return .yellow
            
        case .random:
            return Self.allCases.randomElement()?.uicolor ?? .black
        }
    }
    
}
