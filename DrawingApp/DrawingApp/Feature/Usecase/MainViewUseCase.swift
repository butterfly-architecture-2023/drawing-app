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
    
  }
  
  func tapAddVectorButton() {
    
  }
  
  func tapVector() {
    
  }
  
  func tapSquare() {
    
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
