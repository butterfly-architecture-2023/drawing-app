//
//  ColorType.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import UIKit

enum ColorType: CaseIterable {
    case blue
    case green
    case teal
    case pink
    case purple
    case orange
    case cyan
    case fill
    case gray
    case mint
    case brown
    case indigo
    case yellow

    var uiColor: UIColor {
        switch self {
        case .blue:
            return .systemBlue
        case .green:
            return .systemGreen
        case .teal:
            return .systemTeal
        case .pink:
            return .systemPink
        case .purple:
            return .systemPurple
        case .orange:
            return .systemOrange
        case .cyan:
            return .systemCyan
        case .fill:
            return .systemFill
        case .gray:
            return .systemGray
        case .mint:
            return .systemMint
        case .brown:
            return .systemBrown
        case .indigo:
            return .systemIndigo
        case .yellow:
            return .systemYellow
        }
    }
}
