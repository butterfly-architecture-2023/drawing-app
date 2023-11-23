//
//  DrawButton.swift
//  Drawing
//
//  Created by ByungHoon Ann on 2023/11/06.
//

import UIKit

final class DrawedButton: UIButton {
    let info: DrawingInformation
    
    init(info: DrawingInformation) {
        self.info = info
        super.init(frame: .makeDrawingRectToCGRect(drawingRect: info.rect))
        basicSetUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func basicSetUI() {
        backgroundColor = .convertColor(drawingColor: info.color)
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
