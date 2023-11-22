//
//  MainViewModel+GestureDelegate.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/22.
//

import Foundation
import UIKit

extension MainViewModel: UIGestureRecognizerDelegate {
  
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive event: UIEvent) -> Bool {
    guard let view = view else { return false }
    
    switch gestureRecognizer.state {
    case .began:
      //      useCase?.startVectorCase()
      let imageView = UIImageView()
      self.imageView = imageView
      self.lastPoint = gestureRecognizer.location(in: view)
      view.addSubview(imageView)
    case .changed:
      //      useCase?.changeVectorCase()
      let currentPoint = gestureRecognizer.location(in: view)
      if let lastPoint {
        drawLineFrom(fromPoint: lastPoint, toPoint: currentPoint)
        self.lastPoint = currentPoint
      }
    case .ended:
      if let imageView = imageView,
         let image = imageView.image,
         let data = image.pngData() {
        vectorGestureEnded(data)
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
    guard let imageView = imageView, let view = view else {
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
