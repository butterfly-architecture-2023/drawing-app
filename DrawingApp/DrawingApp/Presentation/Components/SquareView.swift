//
//  SquareView.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import UIKit

protocol SquareViewDelegate: AnyObject {
    func squareViewTapped(_ squareView: SquareView, square id: Int)
}

final class SquareView: UIView {

    weak var delegate: SquareViewDelegate?
    private var squareId: Int?

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

    init(id: Int, position: Position, color: ColorType) {
        self.squareId = id
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
        if let squareId = squareId {
            delegate?.squareViewTapped(self, square: squareId)
        }
    }

    func updateBorderColor(isSelected: Bool) {
        self.layer.borderWidth = isSelected ? 3 : 0
        self.layer.borderColor = isSelected ? UIColor.systemRed.cgColor : UIColor.clear.cgColor
    }
}
