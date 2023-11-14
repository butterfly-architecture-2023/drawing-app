//
//  RectangleView.swift
//  DrawingApp
//
//  Created by 오킹 on 2023/11/15.
//

import UIKit

protocol RectangleViewDelegate {
    func select(rectangleView: RectangleView)
    func deselect(rectangleView: RectangleView)
}

class RectangleView: UIView {

    var delegate: RectangleViewDelegate?
    
    var id: UUID?
    
    private var isSelected: Bool = false {
        didSet {
            oldValue == true ? deselect() : select()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTapGesture()
    }
    
    convenience init(id: UUID, frame: CGRect) {
        self.init(frame: frame)
        self.id = id
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupTapGesture()
    }

    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {
        self.isSelected = !self.isSelected
    }
    
    private func select() {
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 5.0
        
        delegate?.select(rectangleView: self)
    }
    
    private func deselect() {
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 0
        
        delegate?.deselect(rectangleView: self)
    }
}
