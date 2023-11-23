//
//  MainViewModel.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/22.
//

import Foundation
import DrawingAppBusinessDomain
import UIKit

class MainViewModel: NSObject {
  private let squareSelectUseCase: SelectSquareElementUseCase
  private let vectorSelectUseCase: SelectVectorElementUseCase
  
  private let factory: ViewFactory
  var squarePublisher: Published<[Square]>.Publisher {
    factory.$squares
  }
  var vectorPublisher: Published<[Vector]>.Publisher {
    factory.$vectors
  }
  
  var lastPoint: CGPoint?
  var imageView: UIImageView?
  var view: UIView?
  
  init(
    _ factory: ViewFactory,
    _ selectUseCase: SelectSquareElementUseCase,
    _ vectorUseCase: SelectVectorElementUseCase
  ) {
    self.factory = factory
    self.squareSelectUseCase = selectUseCase
    self.vectorSelectUseCase = vectorUseCase
  }
  
  func screenTapped(_ x: Double, _ y: Double) {
    /// 어떤 요소가 선택되었는지는 2 개의 요소를 모두 다루는 factory 에서 파악할 수 있음.
    let elem = factory
      .getElements(at: .init(x: x, y: y))
      .max(by: {$0.order < $1.order})
    
    if let square = elem as? Square {
      squareSelectUseCase.tapped(square)
    } else if let vector = elem as? Vector {
      vectorSelectUseCase.tapped(vector)
    }
  }
  
  func addSquareButtonTapped() {
    let _ = factory.makeElement()
  }
  
  func squarePanGestureEnded(square: Square, _ x: Double, _ y: Double) {
    
  }
  
  func vectorButtonTapped() {
    
  }
  
  func vectorGestureEnded(_ data: Data) {
    let _ = factory.makeElement(data: data)
  }
}

