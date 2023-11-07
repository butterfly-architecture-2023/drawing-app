//
//  RectangleView.swift
//  drawing-app
//
//  Created by 박진섭 on 11/7/23.
//

import UIKit

protocol RectangleViewDelegate: AnyObject {
    func tap(_ id: Int)
}

final class RectangleView: UIView {
    let ID: Int

    weak var delegate: RectangleViewDelegate?

    init(_ rectangle: Rectangle) {
        self.ID = rectangle.hashValue

        super.init(frame: .zero)
        configure(rectangle)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure(_ rectangle: Rectangle) {
        self.frame = .init(origin: .init(x: rectangle.x, y: rectangle.y),
                                  size: .init(width: rectangle.width, height: rectangle.height))
        self.backgroundColor = .init(red: rectangle.style.backgroundRGBA.red,
                                              green: rectangle.style.backgroundRGBA.green,
                                              blue: rectangle.style.backgroundRGBA.blue,
                                              alpha: rectangle.style.backgroundRGBA.alpha)

        let tap = UITapGestureRecognizer(target: self, action: #selector(tap))
        self.addGestureRecognizer(tap)
    }

    @objc private func tap() {
        delegate?.tap(ID)
    }

    func changeBorder() {
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 2.0
    }

    func resetBorder() {
        self.layer.borderColor = nil
        self.layer.borderWidth = 0
    }
}
