//
//  MainViewUseCase.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/14.
//

import Foundation

class MainViewUseCase {
  private let squareFactory: SquareFactory
  private let squareManager: SquareManager
  
  private let vectorFactory: VectorFactory
  private let vectorManager: VectorManager
  
  func tapAddSquareButton() {
    let _ = squareFactory.makeElements()
  }
  
  func endVectorGesture(data: Data) {
    let _ = vectorFactory.makeElements(data)
  }
  
  func tapVector(id: UUID) {
    let _ = vectorManager.makeChange(id, action: .move)
  }
  
  func tapSquare(id: UUID) {
    let square = squareFactory.elements.first(where: {$0.id == id})
    
    if let square = square {
      let _ = squareManager.makeChange(id, action: square.isHighlighted ? .move : .highlight)
    }
  }
  
  init(
    squareFactory: SquareFactory,
    squareManager: SquareManager,
    vectorFactory: VectorFactory,
    vectorManager: VectorManager
  ) {
    self.squareFactory = squareFactory
    self.squareManager = squareManager
    self.vectorFactory = vectorFactory
    self.vectorManager = vectorManager
  }
}
