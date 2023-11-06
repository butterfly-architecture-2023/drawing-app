//
//  RectangleView.swift
//  DrawingApp
//
//  Created by Dongyoung Kwon on 2023/11/05.
//

import UIKit

final class RectangleView: UIView {
    
    // MARK: - property
    
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpUI()
    }
}

extension RectangleView {
    private func setUpUI() {
        setUpView()
        setUpLayout()
        setUpComponents()
    }
    
    private func setUpView() {
        backgroundColor = .white
    }
    
    private func setUpLayout() {
        
    }
    
    private func setUpComponents() {
        
    }
}
