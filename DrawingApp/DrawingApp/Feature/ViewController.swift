//
//  ViewController.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/04.
//

import UIKit
import DrawingAppBusinessDomain

class ViewController: UIViewController {
  let manager = DrawingResourceManager(CanvasSize(
    width: UIScreen.screenWidth,
    height: UIScreen.screenHeight))
  
  let squareButton = UIButton()
  let vectorButton = UIButton()
  let buttonsLayer = UIView()
  
  override func loadView() {
    super.loadView()
    
    // Button Container
    view.addSubview(buttonsLayer)
    buttonsLayer.frame.size = CGSize(width: 475, height: 80)
    buttonsLayer.center = CGPoint(x: view.center.x, y: view.frame.size.height - 80)
    buttonsLayer.layer.borderColor = UIColor.black.cgColor
    buttonsLayer.layer.borderWidth = 1
    
    // Square Button
    squareButton.frame.size = CGSize(width: 200, height: 60)
    squareButton.setTitle("Square", for: .normal)
    squareButton.setTitleColor(.black, for: .normal)
    squareButton.backgroundColor = .clear
    squareButton.layer.borderColor = UIColor.black.cgColor
    squareButton.layer.borderWidth = 1
    buttonsLayer.addSubview(squareButton)
    squareButton.frame.origin = CGPoint(x: 25, y: 10)
    squareButton.addTarget(self, action: #selector(squareButtonTapped(_:)), for: .touchUpInside)
    
    // Vector Button
    vectorButton.frame.size = CGSize(width: 200, height: 60)
    vectorButton.setTitle("Vector", for: .normal)
    vectorButton.setTitleColor(.black, for: .normal)
    vectorButton.backgroundColor = .clear
    vectorButton.layer.borderColor = UIColor.black.cgColor
    vectorButton.layer.borderWidth = 1
    buttonsLayer.addSubview(vectorButton)
    vectorButton.frame.origin = CGPoint(x: 250, y: 10)
    vectorButton.addTarget(self, action: #selector(vectorButtonTapped(_:)), for: .touchUpInside)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
  }
  
  @objc private func squareButtonTapped(_ sender: UIButton) {
    let square = manager.addSquare()
    
    let squareView = UIView(frame: CGRect(
      x: square.position.x,
      y: square.position.y,
      width: square.canvasSize.width,
      height: square.canvasSize.height))
    squareView.backgroundColor = UIColor(
      red: CGFloat(square.colorSet.red),
      green: CGFloat(square.colorSet.green),
      blue: CGFloat(square.colorSet.blue),
      alpha: 1.0)
    
    view.addSubview(squareView)
  }
  
  @objc private func vectorButtonTapped(_ sender: UIButton) {
    let _ = manager.addVector(from: GesturePosition(x: 0, y: 0))
  }
}
