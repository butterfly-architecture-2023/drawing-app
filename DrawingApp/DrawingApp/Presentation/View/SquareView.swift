//
//  SquareView.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import UIKit

final class SquareView: UIView {

    override var frame: CGRect {
        get {
            return super.frame
        }
        set {
            super.frame = CGRect(
                x: newValue.origin.x,
                y: newValue.origin.y,
                width: 100,
                height: 100
            )
        }
    }

    init(x: CGFloat, y: CGFloat) {
        let initialFrame = CGRect(x: x, y: y, width: 100, height: 100)
        super.init(frame: initialFrame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
