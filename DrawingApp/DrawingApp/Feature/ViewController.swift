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
  
  let label: UILabel = {
    let label = UILabel()
    label.text = "Hello world"
    label.textColor = .white
    label.sizeToFit()
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(label)
    label.center = view.center
  }
}
