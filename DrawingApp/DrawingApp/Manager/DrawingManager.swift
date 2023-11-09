//
//  DrawingManager.swift
//  DrawingApp
//
//  Created by leeyeon2 on 11/4/23.
//

import Foundation
import UIKit

class DrawingManager {
    func drawShape(shape: Shape) -> UIView {
        let figureView = UIView(frame: CGRect(x: shape.x,
                                              y: shape.y,
                                              width: shape.width,
                                              height: shape.height))
        figureView.backgroundColor = shape.color
        figureView.tag = shape.id
        return figureView
    }
    
    func isSelectedSquare(selectedView: UIView, 
                          selected: Bool) -> Bool{
        if selected {
            selectedView.layer.borderWidth = 0
            return false
        }else{
            selectedView.layer.borderColor = UIColor.red.cgColor
            selectedView.layer.borderWidth = 2
            return true
        }
    }
}
