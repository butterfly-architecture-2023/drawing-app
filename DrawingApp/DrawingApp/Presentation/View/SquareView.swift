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

    init(position: Position, color: ColorType) {
        let initialFrame = CGRect(x: position.x, y: position.y, width: 100, height: 100)
        super.init(frame: initialFrame)

        self.backgroundColor = color.uiColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
