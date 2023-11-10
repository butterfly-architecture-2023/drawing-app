//
//  ViewController.swift
//  DrawingApp
//
//  Created by 안상희 on 11/5/23.
//

import Combine
import UIKit

class ViewController: UIViewController {
  
  private let canvasView: CanvasView = {
    let view = CanvasView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let panelView: PanelView = {
    let view = PanelView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let viewModel = CanvasViewModel()
  private let input = PassthroughSubject<CanvasViewModel.Input, Never>()
  private var cancellables = Set<AnyCancellable>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    panelView.delegate = self
    
    bind()
    setLayout()
  }
  
  private func bind() {
    let output = viewModel.transform(
      input: input.eraseToAnyPublisher(),
      boundary: Boundary(x: view.bounds.size.width, y: view.bounds.size.height - 100.0)
    )
    
    output
      .sink { [weak self] event in
        guard let self = self else { return }
        switch event {
        case .rectangleDidCreated(let rectangle):
          canvasView.append(rectangle: rectangle)
        }
      }
      .store(in: &cancellables)
  }
  
  private func setLayout() {
    view.backgroundColor = .white
    view.addSubviews([canvasView, panelView])
    
    NSLayoutConstraint.activate([
      canvasView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      canvasView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      canvasView.topAnchor.constraint(equalTo: view.topAnchor),
      canvasView.bottomAnchor.constraint(equalTo: panelView.topAnchor),
      
      panelView.widthAnchor.constraint(equalToConstant: 200),
      panelView.heightAnchor.constraint(equalToConstant: 100),
      panelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      panelView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
    ])
  }
}

extension ViewController: PanelViewDelegate {
  func rectangleButtonDidTapped() {
    input.send(.rectangleButtonDidTapped)
  }
  
  func drawingButtonDidTapped() { }
}
