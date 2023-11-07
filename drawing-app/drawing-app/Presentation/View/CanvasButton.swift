//
//  CanvasButton.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/06.
//

import UIKit

class CanvasButton: UIButton {

    private let title: String
    private var action: (() -> ())
    
    init(title: String, action: @escaping (() -> ())) {
        self.title = title
        self.action = action
        super.init(frame: .zero)
        configUI()
        addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 10
        
        var config: UIButton.Configuration = .plain()
        config.buttonSize = .large
        config.contentInsets = .init(top: 16, leading: 16, bottom: 16, trailing: 16)
        configuration = config
    }
    
    @objc private func tapped() {
        self.action()
    }
}
