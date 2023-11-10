//
//  MainViewFactory.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/07.
//

import UIKit
import DrawingAppBusinessDomain

class MainViewFactory {
  private(set) var squareViews: [UIView] = []
  private(set) var vectors: [Data] = []
  private(set) var stackView: UIStackView?
  let manager: DrawingResourceManager
  
  init(width: CGFloat, height: CGFloat) {
    self.manager = DrawingResourceManager(CanvasSize(width: width, height: height))
  }
  
  func currentVectorColor() -> UIColor? {
    guard let vector = manager.vectors.last else {
      return nil
    }
    
    let set = vector.hexColor.colorSet
    
    return UIColor(red: set.red, green: set.green, blue: set.blue, alpha: 1)
  }
  
  func getButtonStackView(as os: OperatingSystem) -> UIStackView {
    let result = UIStackView()
    result.frame.size = CGSize(
      width: os == .iOS ? 300 : 475,
      height: os == .iOS ? 50 : 80)
    result.layer.borderColor = UIColor.black.cgColor
    result.layer.borderWidth = 1
    result.axis = .horizontal
    result.spacing = 25
    result.distribution = .fillEqually
    result.layoutMargins = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25)
    result.isLayoutMarginsRelativeArrangement = true
    self.stackView = result
    return result
  }
  
  func getSquareMakeButton(as os: OperatingSystem) -> UIButton {
    let result = UIButton()
    result.frame.size = CGSize(
      width: os == .iOS ? 80 : 200,
      height: os == .iOS ? 30 : 60)
    result.setTitle("Square", for: .normal)
    result.setTitleColor(.black, for: .normal)
    result.backgroundColor = .clear
    result.layer.borderColor = UIColor.black.cgColor
    result.layer.borderWidth = 1
    return result
  }
  
  func getVectorMakeButton(as os: OperatingSystem) -> UIButton {
    let result = UIButton()
    result.frame.size = CGSize(
      width: os == .iOS ? 80 : 200,
      height: os == .iOS ? 30 : 60)
    result.setTitle("Vector", for: .normal)
    result.setTitleColor(.black, for: .normal)
    result.backgroundColor = .clear
    result.layer.borderColor = UIColor.black.cgColor
    result.layer.borderWidth = 1
    return result
  }
  
  func addSquare() -> UIView {
    let square = manager.addSquare()
    
    if let stackView {
      let size = square.canvasSize
      let frame = stackView.frame
      while ((frame.minX - size.width) ..< (frame.maxX + size.width) ~= square.position.x
             &&
             (frame.minY - size.height) ..< (frame.maxY + size.height) ~= square.position.y) {
        square.random(manager.canvasSize)
      }
    }
    
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
    self.squareViews.append(squareView)
    
    return squareView
  }
  
  func addVector(at position: GesturePosition, image: UIImage) {
    let _ = manager.addVector(from: position, data: image.pngData())
  }
  
  enum OperatingSystem {
    case iOS, iPad
  }
}
