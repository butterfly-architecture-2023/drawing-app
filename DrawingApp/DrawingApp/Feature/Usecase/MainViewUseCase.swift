//
//  MainViewUseCase.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/14.
//

import Foundation
import DrawingAppBusinessDomain

class MainViewUseCase: ObservableObject {
  @Published private var squareFactory: SquareFactory
  @Published private var squareManager: SquareManager
  
  @Published private var vectorFactory: VectorFactory
  @Published private var vectorManager: VectorManager
  
  var squares: [Square] { squareFactory.elements }
  var vectors: [Vector] { vectorFactory.elements }
  
  func tapAddSquareButton() {
    let _ = squareFactory.makeElements()
  }
  
  func tapVectorButton() {
    
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
  
  func startVectorCase() {
    
  }
  
  func changeVectorCase() {
    
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
