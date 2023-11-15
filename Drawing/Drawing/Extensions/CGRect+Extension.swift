//
//  CGRect+Extension.swift
//  Drawing
//
//  Created by 우리캐피탈 on 2023/11/13.
//

import UIKit

extension CGRect {
    static func makeDrawingRectToCGRect(drawingRect: DrawingRect) -> CGRect {
        return CGRect(
            x: CGFloat(drawingRect.x),
            y: CGFloat(drawingRect.y),
            width: CGFloat(drawingRect.width),
            height: CGFloat(drawingRect.height)
        )
    }
    
    func convertDrawingRect() -> DrawingRect {
        return DrawingRect(x: Float(origin.x),
                           y: Float(origin.y),
                           width: Float(width),
                           height: Float(height))
    }
}
