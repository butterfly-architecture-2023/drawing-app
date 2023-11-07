//
//  CanvasView.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/08.
//

import UIKit

class CanvasView: UIView {
    func draw(_ shape: CAShapeLayer) {
        self.layer.insertSublayer(shape, at: 0)
    }
}
