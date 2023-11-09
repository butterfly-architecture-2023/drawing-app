//
//  PanelView.swift
//  DrawingApp
//
//  Created by 안상희 on 11/5/23.
//

import Combine
import UIKit

protocol PanelViewDelegate: AnyObject {
  func rectangleButtonDidTapped()
  func drawingButtonDidTapped()
}

final class PanelView: UIView {
  
  weak var delegate: PanelViewDelegate?
  
  private let rectangleButton: PanelButton = {
    let button = PanelButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.text = "사각형"
    button.normalImage = UIImage(systemName: "rectangle.on.rectangle")
    button.highlightedImage = UIImage(systemName: "rectangle.on.rectangle.angled")
    button.addTarget(nil, action: #selector(rectangleButtonTapped), for: .touchUpInside)
    return button
  }()
  
  private let drawingButton: PanelButton = {
    let button = PanelButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.text = "드로잉"
    button.normalImage = UIImage(systemName: "pencil.line")
    button.highlightedImage = UIImage(systemName: "pencil.and.scribble")
    button.addTarget(nil, action: #selector(drawingButtonTapped), for: .touchUpInside)
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    setLayout()
  }
  
  @objc private func rectangleButtonTapped() {
    delegate?.rectangleButtonDidTapped()
  }
  
  @objc private func drawingButtonTapped() {
    delegate?.drawingButtonDidTapped()
  }
  
  private func setLayout() {
    backgroundColor = .white
    addSubviews([rectangleButton, drawingButton])
    
    NSLayoutConstraint.activate([
      rectangleButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      rectangleButton.widthAnchor.constraint(equalToConstant: 100),
      rectangleButton.heightAnchor.constraint(equalToConstant: 100),
      rectangleButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      
      drawingButton.leadingAnchor.constraint(equalTo: self.rectangleButton.trailingAnchor),
      drawingButton.widthAnchor.constraint(equalToConstant: 100),
      drawingButton.heightAnchor.constraint(equalToConstant: 100),
      drawingButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
}
