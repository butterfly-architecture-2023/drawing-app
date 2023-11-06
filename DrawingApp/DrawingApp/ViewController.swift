//
//  ViewController.swift
//  DrawingApp
//
//  Created by 안상희 on 11/5/23.
//

import UIKit

class ViewController: UIViewController {
  
  private let panelView: PanelView = {
    let view = PanelView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setLayout()
  }
  
  private func setLayout() {
    view.backgroundColor = .white
    view.addSubview(panelView)
    
    NSLayoutConstraint.activate([
      panelView.widthAnchor.constraint(equalToConstant: 200),
      panelView.heightAnchor.constraint(equalToConstant: 100),
      panelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      panelView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
    ])
  }
}
