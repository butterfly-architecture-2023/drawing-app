//
//  CanvasViewController.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import UIKit
import Combine

final class CanvasViewController: UIViewController {
    private let viewModel = CanvasViewModel()
    private var cancellables = Set<AnyCancellable>()
    private let elementsLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind()
    }
    
    private func setupViews() {
        view.layer.addSublayer(elementsLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapped)))
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(didPanned)))
    }
    
    private func bind() {
        func shapeLayer(for element: some Drawable) -> CAShapeLayer {
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = element.path.cgPath
            shapeLayer.fillColor = element.fillColor?.uiColor.cgColor
            shapeLayer.strokeColor = element.foregroundColor?.uiColor.cgColor
            shapeLayer.lineWidth = 5.0
            return shapeLayer
        }
        
        viewModel.elements
            .sink { [weak self] elements in
                self?.elementsLayer.sublayers?.forEach { $0.removeFromSuperlayer() }
                for element in elements {
                    let shapeLayer = shapeLayer(for: element)
                    self?.elementsLayer.addSublayer(shapeLayer)
                }
            }
            .store(in: &cancellables)
    }
    

    @objc
    private func didTapped(sender: UITapGestureRecognizer) {
        let point = sender.location(in: view)
        viewModel.didTapped(point: point)
    }
    
    @objc
    private func didPanned(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            viewModel.didDrawBegan()
        case .changed:
            let point = sender.location(in: view)
            viewModel.didDraw(point: point)
        case .ended, .failed, .cancelled:
            break
        default:
            break
        }
    }
}
