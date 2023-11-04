//
//  SquareView.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import UIKit

protocol SquareViewDelegate: AnyObject {
    func squareViewTapped(_ squareView: SquareView)
}

final class SquareView: UIView {

    weak var delegate: SquareViewDelegate?

    override var frame: CGRect {
        get {
            return super.frame
        }
        set {
            super.frame = CGRect(
                x: newValue.origin.x,
                y: newValue.origin.y,
                width: Constants.squareWidth,
                height: Constants.squareHeight
            )
        }
    }

    init(position: Position, color: ColorType) {
        let initialFrame = CGRect(
            x: position.x,
            y: position.y,
            width: Constants.squareWidth,
            height: Constants.squareHeight
        )
        super.init(frame: initialFrame)
        self.backgroundColor = color.uiColor

        setupTapGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
        isUserInteractionEnabled = true
    }

    @objc private func handleTap() {
        delegate?.squareViewTapped(self)
    }
}
