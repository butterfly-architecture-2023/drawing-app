//
//  PaddingLabel.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/06.
//

import UIKit

final class PaddingButton: UIButton {
    private var padding: UIEdgeInsets = .zero
    private var imageSpacing: CGFloat = 10
    private var contentSize: CGSize = .zero
    
    // MARK: - Initializer
    
    init(padding: UIEdgeInsets = .zero, imageSpacing: CGFloat = 10) {
        self.padding = padding
        self.imageSpacing = imageSpacing
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension PaddingButton {
    
    override func draw(_ rect: CGRect) {
        setRoundedCorners()
        setImageSpacing(spacing: 8)
        setBorder()
        
        let paddingRect = rect.inset(by: padding)
        super.draw(paddingRect)
    }

    override var intrinsicContentSize: CGSize {
        guard contentSize == CGSize.zero else {
            return contentSize
        }
        
        contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        return contentSize
    }
    
    private func setRoundedCorners() {
        clipsToBounds = true
        layer.cornerRadius = frame.size.height / 2
    }
    
    private func setImageSpacing(spacing: CGFloat) {
        semanticContentAttribute = .forceLeftToRight
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: spacing)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: 0)
    }
    
    private func setBorder() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.init(white: 0.8, alpha: 1).cgColor
    }
    
}
