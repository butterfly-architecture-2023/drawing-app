//
//  RectView.swift
//  DrawingApp
//
//  Created by 김도형 on 2023/11/09.
//

import UIKit

final class RectView: UIView {
    let id: UUID
    
    init(id: UUID, frame: CGRect) {
        self.id = id
        super.init(frame: frame)
        self.backgroundColor = UIColor.random()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSelected() {
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.systemRed.cgColor
    }
    
}
