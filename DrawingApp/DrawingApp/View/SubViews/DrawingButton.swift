//
//  DrawingButton.swift
//  DrawingApp
//
//  Created by elly on 11/4/23.
//

import UIKit

class DrawingButton: UIButton {
    
    // MARK: - UI Items
    
    private var coverView: UIView = UIView().then {
        $0.isUserInteractionEnabled = false
    }
    private var iconImageView: UIImageView = UIImageView()
    private var buttonTitle: UILabel = UILabel()
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isEnabled = true
    }
    
    convenience init(_ type: DrawingButtonType) {
        self.init(frame: .zero)
        
        makeDrawingButton(by: type)
        
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeDrawingButton(by type: DrawingButtonType) {
        let info = type.info()
        iconImageView.image = UIImage(named: info.imageName)
        buttonTitle.text = info.title
    }
}


// MARK: - UI

extension DrawingButton: UISubviewStyle {
    func addSubviews() {
        self.addSubview(coverView)
        coverView.addSubview(iconImageView)
        coverView.addSubview(buttonTitle)
    }
    
    func makeConstraints() {
        coverView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalToSuperview().offset(8)
            $0.bottom.equalToSuperview().offset(-5)
        }
        iconImageView.snp.makeConstraints {
            $0.width.height.equalTo(60)
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        buttonTitle.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
