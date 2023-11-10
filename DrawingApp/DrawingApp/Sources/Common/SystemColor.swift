//
//  SystemColor.swift
//  DrawingApp
//
//  Created by Dongyoung Kwon on 2023/11/06.
//

import UIKit

enum SystemColor: String, CaseIterable {
    case blue, cyan, gray, mint, pink, teal
    case brown, green, indigo, orange, purple, yellow
    
    var uiColor: UIColor {
        switch self {
        case .blue:
            return UIColor.systemBlue
        case .cyan:
            return UIColor.systemCyan
        case .gray:
            return UIColor.systemGray
        case .mint:
            return UIColor.systemMint
        case .pink:
            return UIColor.systemPink
        case .teal:
            return UIColor.systemTeal
        case .brown:
            return UIColor.systemBrown
        case .green:
            return UIColor.systemGreen
        case .indigo:
            return UIColor.systemIndigo
        case .orange:
            return UIColor.systemOrange
        case .purple:
            return UIColor.systemPurple
        case .yellow:
            return UIColor.systemYellow
        }
    }
    
    static var random: Self {
        SystemColor.allCases.randomElement() ?? .blue
    }
}

