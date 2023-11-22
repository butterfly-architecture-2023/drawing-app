//
//  ViewController.swift
//  DrawingApp
//
//  Created by elly on 11/4/23.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    // MARK: - UI Items
    
    private var canvasView: CanvasView = CanvasView().then {
        $0.backgroundColor = .white
    }
    private var drawingToolView: UIStackView = UIStackView().then {
        $0.backgroundColor = .systemPink
        $0.alignment = .center
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    private var rectangleButton: DrawingButton = DrawingButton(.rectangle)
    private var drawingButton: DrawingButton = DrawingButton(.drawing)
    
    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rectangleButton.addTarget(self, action: #selector(rectangleButtonTapped), for: .touchUpInside)
        drawingButton.addTarget(self, action: #selector(drawingButtonTapped), for: .touchUpInside)
        canvasView.delegate = self
        viewModel.screenSize = UIScreen.main.bounds
        
        bindViewModel()
        
        addSubviews()
        makeConstraints()
    }
    
    @objc func drawingButtonTapped() {
        viewModel.updateMode(.drawing)
    }
    
    @objc func rectangleButtonTapped() {
        viewModel.updateMode(.rectangle)
    }
    
    private func bindViewModel() {
        viewModel.refreshCanvas = { [weak self] info in
            self?.canvasView.setGraphicsInfo(info)
        }
        
        viewModel.updateUserInteractionEnable = { [weak self] mode in
            self?.canvasView.setMode(mode)
            
        }
    }
}


// MARK: - EventDelegate

extension ViewController: EventDelegate {
    func send(_ info: any PositionProtocol) {
        viewModel.setPosition(info)
    }
}


// MARK: - UI

extension ViewController: UISubviewStyle {
    func addSubviews() {
        self.view.addSubview(canvasView)
        self.view.addSubview(drawingToolView)
        drawingToolView.addArrangedSubview(rectangleButton)
        drawingToolView.addArrangedSubview(drawingButton)
    }
    
    func makeConstraints() {
        canvasView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview().offset(-150)
        }
        drawingToolView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-16)
            let width = UIScreen.main.bounds.width
            $0.width.lessThanOrEqualTo(width)
            $0.width.greaterThanOrEqualTo(300)
            $0.height.equalTo(100)
        }
    }
}
