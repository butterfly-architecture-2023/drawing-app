//
//  Color.swift
//  DrawingApp
//
//  Created by 오킹 on 2023/11/08.
//

import UIKit

enum Color: CaseIterable {
    case blue
    case pink
    case teal
    case green
    case indigo
    case orange
    case purple
    case yellow
    case gray
    case gray2
    case gray3
    case gray4
    case gray5
    case gray6
    
    var uiColor: UIColor {
        switch self {
        case .blue:
            return .systemBlue
        case .pink:
            return .systemPink
        case .teal:
            return .systemTeal
        case .green:
            return .systemGreen
        case .indigo:
            return .systemIndigo
        case .orange:
            return .systemOrange
        case .purple:
            return .systemPurple
        case .yellow:
            return .systemYellow
        case .gray:
            return .systemGray
        case .gray2:
            return .systemGray2
        case .gray3:
            return .systemGray3
        case .gray4:
            return .systemGray4
        case .gray5:
            return .systemGray5
        case .gray6:
            return .systemGray6
        }
    }
    
    static func random() -> Color {
        return Self.allCases.randomElement()!
    }
}
