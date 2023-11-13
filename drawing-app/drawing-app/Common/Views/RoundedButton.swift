//
//  RoundedButton.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/06.
//

import UIKit

final class RoundedButton: UIButton {
    
    private var imageSpacing: CGFloat = 10
    private var contentSize: CGSize = .zero
    private var drawingType: DrawingType?
    
    // MARK: - Initializer
    
    init(imageSpacing: CGFloat = 10, drawingType: DrawingType) {
        self.imageSpacing = imageSpacing
        self.drawingType = drawingType
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension RoundedButton {
    
    override func draw(_ rect: CGRect) {
        setRoundedCorners()
        setImageSpacing(spacing: 8)
        setBorder()
        setupViews()
        
        super.draw(rect)
    }

    private func setupViews() {
        guard let drawingType else { return }
        
        setTitleColor(.black, for: .normal)
        setTitle(drawingType.title, for: .normal)
        setImage(drawingType.icon, for: .normal)
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
