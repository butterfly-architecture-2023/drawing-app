//
//  iPadMainViewController.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/04.
//

import UIKit

class iPadMainViewController: UIViewController {
  private let useCase: MainViewUseCase?
  private lazy var squareButton: UIButton = UIButton(frame: .init(origin: .zero, size: CGSize(width: 200, height: 60)))
  private lazy var vectorButton: UIButton = UIButton(frame: .init(origin: .zero, size: CGSize(width: 200, height: 60)))
  private lazy var buttonsLayer: UIStackView = UIStackView(frame: .init(origin: .zero, size: CGSize(width: 475, height: 80)))
  
  private lazy var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureHandler(_:)))
  private var imageView: UIImageView?
  private var lastPoint: CGPoint?
  
  init(useCase: MainViewUseCase) {
    self.useCase = useCase
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
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
    useCase?.tapAddSquareButton()
  }
  
  @objc private func vectorButtonTapped(_ sender: UIButton) {
    useCase?.tapVectorButton()
  }
  
  @objc private func panGestureHandler(_ sender: UIPanGestureRecognizer) {
    switch sender.state {
    case .began:
      useCase?.startVectorCase()
    case .changed:
      useCase?.changeVectorCase()
    case .ended:
      if let imageView = imageView,
         let image = imageView.image,
         let data = image.pngData() {
        useCase?.endVectorGesture(data: data)
      }
      imageView = nil
      lastPoint = nil
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
    
    context?.setStrokeColor(UIColor.black.cgColor)
    
    context?.setBlendMode(.normal)
    context?.strokePath()
    
    imageView.frame = view.frame
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    imageView.image = newImage
    UIGraphicsEndImageContext()
    view.setNeedsLayout()
  }
}
