//
//  ToolbarView.swift
//  DrawingApp
//
//  Created by Dongyoung Kwon on 2023/11/05.
//

import UIKit

protocol ToolbarViewDelegate: AnyObject {
    func onTapRectangleItemButton()
    func onTapDrawingItemButton()
}

final class ToolbarView: UIStackView {
    
    // MARK: - property
    
    // INTERNAL
    weak var delegate: ToolbarViewDelegate?
    
    // MARK: - ui component property
    
    private let rectangleItemButton: UIButton = .init()
    private let drawingItemButton: UIButton = .init()
    
    // MARK: - life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpUI()
    }
}

// MARK: - set up UI

extension ToolbarView {
    private func setUpUI() {
        setUpStackView()
        setUpLayout()
        setUpComponent()
    }
    
    private func setUpStackView() {
        axis = .horizontal
        spacing = 1
        
        backgroundColor = .systemGray2
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray2.cgColor
        layer.cornerRadius = 10
    }
    
    private func setUpLayout() {
        [rectangleItemButton, drawingItemButton].forEach {
            addArrangedSubview($0)
        }
    }
    
    private func setUpComponent() {
        setUpRectangleItemButton()
        setUpDrawingItemButton()
    }
    
    private func setUpRectangleItemButton() {
        var config = UIButton.Configuration.plain()
        config.image = .init(systemName: "rectangle")
        config.imagePlacement = .top
        config.imagePadding = 10
        config.title = "사각형"
        
        rectangleItemButton.configuration = config
        rectangleItemButton.backgroundColor = .white
        rectangleItemButton.tintColor = .black
        
        rectangleItemButton.addAction(
            .init(handler: { [weak self] _ in
                self?.delegate?.onTapRectangleItemButton()
            }),
            for: .touchUpInside
        )
    }
    
    private func setUpDrawingItemButton() {
        var config = UIButton.Configuration.plain()
        config.image = .init(systemName: "pencil.and.scribble")
        config.imagePlacement = .top
        config.imagePadding = 10
        config.title = "드로잉"
        
        drawingItemButton.configuration = config
        drawingItemButton.backgroundColor = .white
        drawingItemButton.tintColor = .black
        
        drawingItemButton.addAction(
            .init(handler: { [weak self] _ in
                self?.delegate?.onTapDrawingItemButton()
            }),
            for: .touchUpInside
        )
    }
}
