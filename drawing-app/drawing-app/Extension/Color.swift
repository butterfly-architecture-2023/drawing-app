//
//  Extension+Color.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/07.
//

import UIKit

extension UIColor {
    static var randomSystemColor: UIColor {
        let systemColor: [UIColor] = [.systemBlue, .systemCyan, .systemMint, .systemPink, .systemTeal, .systemBrown, .systemIndigo, .systemOrange, .systemPurple, .systemYellow]
        return systemColor.randomElement() ?? .systemBlue
    }
}
