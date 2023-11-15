//
//  iOSMainViewController.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/07.
//

import UIKit
import Combine

class iOSMainViewController: UIViewController {
  private var subscriptions = Set<AnyCancellable>()
  
  private let useCase: MainViewUseCase
  
  private var squareButton = UIButton()
  private var vectorButton = UIButton()
  private var buttonsLayer = UIStackView()
  
  private lazy var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureHandler(_:)))
  private lazy var gestureDelegate = MainViewGestureDelegate(useCase: useCase, canvas: view)
  
  init(useCase: MainViewUseCase) {
    self.useCase = useCase
    super.init(nibName: nil, bundle: nil)
    
    useCase.objectWillChange.sink { _ in
      for s in useCase.squares {
        
      }
      for v in useCase.vectors {
        
      }
    }
    .store(in: &subscriptions)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    super.loadView()
    view.backgroundColor = .white
    
    squareButton.setLayout()
    squareButton.setTitle("Vector", for: .normal)
    vectorButton.setLayout()
    vectorButton.setTitle("Vector", for: .normal)
    buttonsLayer.setLayout()
    
    view.addSubview(buttonsLayer)
    buttonsLayer.center.x = view.frame.width / 2
    buttonsLayer.center.y = view.frame.height - buttonsLayer.frame.height - 1
    buttonsLayer.addArrangedSubview(squareButton)
    buttonsLayer.addArrangedSubview(vectorButton)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    squareButton.addTarget(self, action: #selector(squareButtonTapped(_:)), for: .touchUpInside)
    vectorButton.addTarget(self, action: #selector(vectorButtonTapped(_:)), for: .touchUpInside)
    
    panGestureRecognizer.delegate = gestureDelegate
  }
  
  @objc private func squareButtonTapped(_ sender: UIButton) {
    useCase.tapAddSquareButton()
  }
  
  @objc private func vectorButtonTapped(_ sender: UIButton) {
    useCase.tapVectorButton()
    if let gestures = view.gestureRecognizers, gestures.contains(where: {$0 == panGestureRecognizer}) {
      view.removeGestureRecognizer(panGestureRecognizer)
    } else {
      view.addGestureRecognizer(panGestureRecognizer)
    }
  }
  
  @objc private func panGestureHandler(_ sender: UIPanGestureRecognizer) {
  }
}

private extension UIButton {
  func setLayout() {
    self.frame.size = CGSize(width: 80, height: 30)
    self.setTitleColor(.black, for: .normal)
    self.backgroundColor = .clear
    self.layer.borderColor = UIColor.black.cgColor
    self.layer.borderWidth = 1
  }
}

private extension UIStackView {
  func setLayout() {
    self.frame.size = CGSize(width: 300, height: 50)
    self.layer.borderColor = UIColor.black.cgColor
    self.layer.borderWidth = 1
    self.axis = .horizontal
    self.spacing = 25
    self.distribution = .fillEqually
    self.layoutMargins = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25)
    self.isLayoutMarginsRelativeArrangement = true
  }
}
