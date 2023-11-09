//
//  UIColor.swift
//  drawing-app
//
//  Created by 윤소희 on 2023/11/06.
//

import UIKit

extension UIColor {
    static func randomSystemColor() -> UIColor {
        let systemColors: [UIColor] = [
            .systemBlue,
            .systemCyan,
            .systemGray,
            .systemMint,
            .systemPink,
            .systemTeal,
            .systemBrown,
            .systemOrange,
            .systemPurple,
            .systemYellow,
            .systemIndigo
        ]
        
        let randomIndex = Int.random(in: 0..<systemColors.count)
        return systemColors[randomIndex]
    }
}
