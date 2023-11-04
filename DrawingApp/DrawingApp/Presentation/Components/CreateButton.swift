//
//  CreateButton.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import UIKit

final class CreateButton: UIButton {

    convenience init(text title: String) {
        self.init()
        self.setTitle(title, for: .normal)
        self.setConfiguration()
    }

    private func setConfiguration() {
        self.clipsToBounds = true
        self.backgroundColor = .white
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 12
    }
}
