//
//  iPadMainViewController.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/04.
//

import UIKit

class iPadMainViewController: UIViewController {
  private let factory = MainViewFactory(
    width: UIScreen.screenWidth,
    height: UIScreen.screenHeight)
  
  private lazy var squareButton: UIButton = factory.getSquareMakeButton(as: .iPad)
  private lazy var vectorButton: UIButton = factory.getVectorMakeButton(as: .iPad)
  private lazy var buttonsLayer: UIStackView = factory.getButtonStackView(as: .iPad)
  
  override func loadView() {
    super.loadView()
    
    view.backgroundColor = .white
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
  }
  
  @objc private func squareButtonTapped(_ sender: UIButton) {
    view.addSubview(factory.addSquare())
  }
  
  @objc private func vectorButtonTapped(_ sender: UIButton) {
    if let vector = factory.addVector() {
      view.addSubview(UIImageView(image: vector))
    }
  }
}
