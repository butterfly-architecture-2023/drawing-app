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
        view.layer.addSublayer(elementsLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapped)))
        viewModel.elements
            .sink { [weak self] elements in
                self?.elementsLayer.sublayers?.forEach { $0.removeFromSuperlayer() }
                for element in elements {
                    let shapeLayer = CAShapeLayer()
                    shapeLayer.path = element.path.cgPath
                    shapeLayer.strokeColor = element.foregroundColor?.uiColor.cgColor
                    shapeLayer.lineWidth = 1.0
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
}
