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
    
    private lazy var makeSquareButton = PaddingButton().then {
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle(DrawingType.square.title, for: .normal)
        $0.setImage(DrawingType.square.icon, for: .normal)
    }
    
    private lazy var drawingButton = PaddingButton().then {
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle(DrawingType.drawing.title, for: .normal)
        $0.setImage(DrawingType.drawing.icon, for: .normal)
    }
    
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
