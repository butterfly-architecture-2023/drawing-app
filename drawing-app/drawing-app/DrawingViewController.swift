//
//  DrawingViewController.swift
//  drawing-app
//
//  Created by 박진섭 on 11/4/23.
//

import UIKit
import SnapKit

class DrawingViewController: UIViewController {
    
    private var addRectangleButton: UIButton {
        let button = UIButton()
        button.configuration = makeButtonConfigure(title: "사각형", imageName: "square")
        button.addTarget(self, action: #selector(tabAddRectangleButton) , for: .touchUpInside)
        return button
    }

    private var drawingButton: UIButton {
        let button = UIButton()
        button.configuration = makeButtonConfigure(title: "드로잉", imageName: "scribble.variable")
        button.addTarget(self, action: #selector(tabDrawingButton), for: .touchUpInside)
        return button
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        addButtonStackView()
    }


    @objc private func tabAddRectangleButton() {
        print("Tapped add rectangle button!")
    }

    @objc private func tabDrawingButton() {
        print("Tapped drawing button!")
    }

    private func makeButtonConfigure(title: String, imageName: String) -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        config.background.strokeColor = .black
        config.background.strokeWidth = 1.0
        config.title = title
        config.imagePlacement = .top
        config.image = UIImage(systemName: imageName)
        config.imagePadding = 10
        config.baseForegroundColor = .black
        return config
    }

    private func addButtonStackView() {
        let stackView = UIStackView(arrangedSubviews: [addRectangleButton, drawingButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        self.view.addSubview(stackView)

        stackView.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(100)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }

    }
}
