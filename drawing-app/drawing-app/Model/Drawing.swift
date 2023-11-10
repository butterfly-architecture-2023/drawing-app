//
//  Drawing.swift
//  drawing-app
//
//  Created by 윤소희 on 2023/11/06.
//

import UIKit

struct Drawing: Drawable {
    
    var id: UUID = UUID()
    var path: UIBezierPath
    var color: UIColor
    var lineWidth: CGFloat
    
    init(path: UIBezierPath, color: UIColor, lineWidth: CGFloat) {
        self.id = UUID()
        self.path = path
        self.color = color
        self.lineWidth = lineWidth
    }
}



