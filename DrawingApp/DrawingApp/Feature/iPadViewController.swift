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
  
  private lazy var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureHandler(_:)))
  private var imageView: UIImageView?
  private var lastPoint: CGPoint?
  
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
    view.addGestureRecognizer(panGestureRecognizer)
  }
  
  @objc private func panGestureHandler(_ sender: UIPanGestureRecognizer) {
    switch sender.state {
    case .began:
      imageView = UIImageView()
      view.addSubview(imageView!)
      lastPoint = CGPoint(x: sender.location(in: view).x, y: sender.location(in: view).y)
    case .changed:
      let currentPoint = CGPoint(x: sender.location(in: view).x, y: sender.location(in: view).y)
      if let point = lastPoint {
        drawLineFrom(fromPoint: point, toPoint: currentPoint)
        lastPoint = currentPoint
      }
    case .ended:
      if let imageView = imageView, let image = imageView.image {
        factory.addVector(at: .init(x: imageView.frame.minX, y: imageView.frame.minY), image: image)
      }
      imageView = nil
      lastPoint = nil
      view.removeGestureRecognizer(panGestureRecognizer)
      break
    default:
      return
    }
  }
  
  func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
    guard let imageView = self.imageView else {
      return
    }
    UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 1.0)
    let context = UIGraphicsGetCurrentContext()
    
    imageView.image?.draw(in: view.frame)
    
    context?.move(to: fromPoint)
    context?.addLine(to: toPoint)
    
    context?.setLineCap(.round)
    context?.setLineWidth(2.5)
    
    let color = factory.currentVectorColor() ?? .black
    context?.setStrokeColor(color.cgColor)
    
    context?.setBlendMode(.normal)
    context?.strokePath()
    
    imageView.frame = view.frame
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    imageView.image = newImage
    UIGraphicsEndImageContext()
    view.setNeedsLayout()
  }
}
