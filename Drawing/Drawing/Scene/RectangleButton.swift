//
//  RectangleButton.swift
//  Drawing
//
//  Created by ByungHoon Ann on 2023/11/06.
//

import UIKit


class RectangleButton: UIButton {
    private let shape: Shape
    
    var id: String {
        return shape.id
    }
    
    init(shape: Shape) {
        self.shape = shape
        super.init(frame: shape.frame)
        backgroundColor = shape.color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func clear() {
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 0
    }
    
    func active() {
        layer.borderColor = UIColor.systemRed.cgColor
        layer.borderWidth = 2
    }
}
