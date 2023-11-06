//
//  CanvasViewController.swift
//  drawing-app
//
//  Created by Jihee hwang on 2023/11/06.
//

import UIKit
import SnapKit
import Then

final class CanvasViewController: UIViewController {
    
    // MARK: - Views
    
    private lazy var makeSquareButton = RoundedButton(drawingType: .square)
    private lazy var drawingButton = RoundedButton(drawingType: .drawing)
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

}

// MARK: - configure UI

extension CanvasViewController {
    
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(makeSquareButton)
        view.addSubview(drawingButton)
        
        makeSquareButton.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(50)
            $0.right.equalTo(view.snp.centerX).offset(-10)
            $0.bottom.equalToSuperview().inset(50)
        }
        
        drawingButton.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(50)
            $0.left.equalTo(view.snp.centerX).offset(10)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
    
}
