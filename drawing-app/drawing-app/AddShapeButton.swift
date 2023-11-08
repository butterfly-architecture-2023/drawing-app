//
//  AddRectnagleButton.swift
//  drawing-app
//
//  Created by 박진섭 on 11/5/23.
//

import UIKit

final class AddShapeButton: UIButton {

    init(title: String, imageName: String, _ selector: Selector) {
        super.init(frame: .zero)
        self.configure(title: title, imageName: imageName)
        self.addTarget(self.superview, action: selector, for: .touchUpInside)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure(title: String, imageName: String) {
        var config = UIButton.Configuration.plain()
        config.title = title
        config.image = UIImage(systemName: imageName)
        config.background.strokeColor = .black
        config.background.strokeWidth = 1.0
        config.imagePlacement = .top
        config.imagePadding = 10
        config.baseForegroundColor = .black
        self.configuration = config
    }
}
