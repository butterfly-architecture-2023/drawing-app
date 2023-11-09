//
//  Rectangle.swift
//  drawing-app
//
//  Created by 윤소희 on 2023/11/06.
//

import UIKit

struct Rectangle: Drawable {
    var id: UUID = UUID()
    var color: UIColor
    var frame: CGRect
    var isSelected: Bool = false

    
    init(x: CGFloat, y: CGFloat, color: UIColor, isSelected: Bool = false) {
           self.id = UUID()
           self.frame = CGRect(x: x, y: y, width: 100, height: 100)
           self.color = color
           self.isSelected = isSelected
       }
    
}
