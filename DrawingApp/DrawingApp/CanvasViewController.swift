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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapped)))
        viewModel.elements
            .sink { elements in
                print(elements)
            }
            .store(in: &cancellables)
    }

    @objc
    private func didTapped(sender: UITapGestureRecognizer) {
        let point = sender.location(in: view)
        viewModel.didTapped(point: point)
        print("T", point)
    }
}
