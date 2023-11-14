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
  
  private var vectorImageView: UIImageView?
  
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
      let size = square.size
      let frame = stackView.frame
      while ((frame.minX - size.width) ..< (frame.maxX + size.width) ~= square.position.x
             &&
             (frame.minY - size.height) ..< (frame.maxY + size.height) ~= square.position.y) {
        square.randomPosition(manager.canvasSize)
      }
    }
    
    let squareView = UIView(frame: CGRect(at: square.position, in: square.size))
    squareView.backgroundColor = UIColor(square.color)
    self.squareViews.append(squareView)
    
    return squareView
  }
  
  func addVector(at rect: CGRect, image: UIImage) {
    let vector = manager.addVector(data: image.pngData())
    vector.setPosition(x: rect.minX, y: rect.minY)
    vector.setSize(width: rect.width, height: rect.height)
  }
  
  enum OperatingSystem {
    case iOS, iPad
  }
}

private extension CGSize {
  init(_ size: CanvasSize) {
    self.init(width: size.width, height: size.height)
  }
}

private extension CGPoint {
  init(_ position: CanvasPosition) {
    self.init(x: position.x, y: position.y)
  }
}

private extension CGRect {
  init(at position: CanvasPosition, in size: CanvasSize) {
    self.init(origin: CGPoint(position), size: CGSize(size))
  }
}

private extension UIColor {
  convenience init(_ color: CanvasColor) {
    let set = color.colorSet
    self.init(red: set.red, green: set.green, blue: set.blue, alpha: set.alpha)
  }
}
