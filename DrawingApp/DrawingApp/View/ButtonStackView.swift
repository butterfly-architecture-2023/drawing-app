//
//  ButtonStackListView.swift
//  DrawingApp
//
//  Created by leeyeon2 on 11/4/23.
//

import Foundation
import UIKit

class ButtonStackView: UIStackView {
    var stackList = [UIView]()
    
    func buttonStackView() -> UIStackView {
        return self.createButtonStack(stakList: self.stackList)
    }
    
    func createButton(shape: DrawingButton, gesture: UITapGestureRecognizer)  {
        let shape = shape
        let buttonView = ButtonView().createButtonStack(stakList: [shape.imageStackView, shape.nameLabel])
        buttonView.addGestureRecognizer(gesture)
        buttonView.isUserInteractionEnabled = true
        stackList.append(buttonView)
    }
    
    func createButtonStack(stakList: [UIView]) -> UIStackView {
        let buttonView: UIStackView = {
            let buttonView = UIStackView(arrangedSubviews: stakList)
            buttonView.alignment = .fill
            buttonView.distribution = .fillEqually
            buttonView.backgroundColor = .white
            buttonView.spacing = 10
            buttonView.axis = .horizontal
            
            return buttonView
        }()
        return buttonView
    }
}

class ButtonView: ButtonStackView {
    override func createButtonStack(stakList: [UIView]) -> UIStackView {
        let buttonView = super.createButtonStack(stakList: stakList)
        
        buttonView.alignment = .center
        buttonView.distribution = .fillProportionally
        buttonView.axis = .vertical
        return buttonView
    }
}
