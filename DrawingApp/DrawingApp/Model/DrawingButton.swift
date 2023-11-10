//
//  DrawingButton.swift
//  DrawingApp
//
//  Created by leeyeon2 on 11/4/23.
//

import Foundation
import UIKit
let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .large)
 
protocol DrawingButton {
    var imageStackView: UIImageView { get set }
    var nameLabel: UILabel { get set }

    //그리기 메소드
    func drawSquare(_ sender: UITapGestureRecognizer)
}

class SquareButton: DrawingButton {
    func drawSquare(_ sender: UITapGestureRecognizer)   {
        print("dd Clicked")
    }

    var imageStackView: UIImageView
    var nameLabel: UILabel
    
    init() {
        self.imageStackView = UIImageView()
        self.imageStackView.image = UIImage(systemName: "square", withConfiguration: largeConfig)
        self.imageStackView.tintColor = .black
        self.nameLabel = UILabel()
        self.nameLabel.text = "사각형"
    }
}

class DrawButton: DrawingButton {
    func drawSquare(_ sender: UITapGestureRecognizer) {
        print("dd Clicked")
    }

    var imageStackView: UIImageView
    var nameLabel: UILabel
    
    init() {
        self.imageStackView = UIImageView()
        self.imageStackView.image = UIImage(systemName: "hand.draw", withConfiguration: largeConfig)
        self.imageStackView.tintColor = .black
        self.nameLabel = UILabel()
        self.nameLabel.text = "드로잉"
    }
}
