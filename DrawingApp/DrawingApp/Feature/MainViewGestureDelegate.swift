//
//  MainViewGestureDelegate.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/15.
//

import UIKit

class MainViewGestureDelegate: NSObject, UIGestureRecognizerDelegate {
  private var imageView: UIImageView?
  private var lastPoint: CGPoint?
  private let useCase: MainViewUseCase?
  private let canvas: UIView
  
  init(useCase: MainViewUseCase, canvas view: UIView) {
    self.useCase = useCase
    self.canvas = view
  }
  
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive event: UIEvent) -> Bool {
    switch gestureRecognizer.state {
    case .began:
      useCase?.startVectorCase()
      let imageView = UIImageView()
      self.imageView = imageView
      self.lastPoint = gestureRecognizer.location(in: canvas)
      canvas.addSubview(imageView)
    case .changed:
      useCase?.changeVectorCase()
      let currentPoint = gestureRecognizer.location(in: canvas)
      if let lastPoint {
        drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
        self.lastPoint = currentPoint
      }
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
      print("iduno")
      return true
    }
    
    return true
  }
  
  func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
    guard let imageView = imageView else {
      return
    }
    UIGraphicsBeginImageContextWithOptions(canvas.frame.size, false, 1.0)
    let context = UIGraphicsGetCurrentContext()
    
    imageView.image?.draw(in: canvas.frame)
    
    context?.move(to: fromPoint)
    context?.addLine(to: toPoint)
    
    context?.setLineCap(.round)
    context?.setLineWidth(2.5)
    
    context?.setStrokeColor(UIColor.black.cgColor)
    
    context?.setBlendMode(.normal)
    context?.strokePath()
    
    imageView.frame = canvas.frame
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    imageView.image = newImage
    UIGraphicsEndImageContext()
    canvas.setNeedsLayout()
  }
}
