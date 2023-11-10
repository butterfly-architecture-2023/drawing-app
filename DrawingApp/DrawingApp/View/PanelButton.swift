//
//  PanelButton.swift
//  DrawingApp
//
//  Created by 안상희 on 11/5/23.
//

import UIKit

final class PanelButton: UIButton {
  
  private let stackView: UIStackView = {
    let view = UIStackView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.isUserInteractionEnabled = false
    view.axis = .vertical
    view.alignment = .center
    view.distribution = .fillEqually
    return view
  }()
  
  private let panelImageView: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.isUserInteractionEnabled = false
    view.contentMode = .scaleAspectFit
    view.tintColor = .black
    return view
  }()
  
  private let label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    return label
  }()
  
  var text: String? {
    didSet {
      label.text = text
    }
  }
  
  var normalImage: UIImage? {
    didSet {
      updateStateUI()
    }
  }
  
  var highlightedImage: UIImage? {
    didSet { 
      updateStateUI()
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    setLayout()
  }
  
  override var isHighlighted: Bool {
    didSet {
      updateStateUI()
    }
  }
  
  override func setImage(_ image: UIImage?, for state: UIControl.State) {
    switch state {
    case .normal:
      normalImage = image
      
    case .highlighted:
      highlightedImage = image
      
    default: break
    }
  }
  
  private func setLayout() {
    addSubview(stackView)
    [panelImageView, label].forEach(stackView.addArrangedSubview(_:))
    
    NSLayoutConstraint.activate([
      stackView.leftAnchor.constraint(equalTo: leftAnchor),
      stackView.rightAnchor.constraint(equalTo: rightAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
      stackView.topAnchor.constraint(equalTo: topAnchor)
    ])
    
    self.layer.borderWidth = 1
    self.layer.borderColor = UIColor.black.cgColor
  }
  
  private func updateStateUI() {
    switch state {
    case .normal:
      label.alpha = 1
      panelImageView.image = normalImage
      
    case .highlighted:
      label.alpha = 0.5
      panelImageView.image = highlightedImage
      
    default:
      break
    }
  }
}
