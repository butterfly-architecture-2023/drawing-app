//
//  DIContainer.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/15.
//

import UIKit
import DrawingAppBusinessDomain

class DIContainer {
  let manager = DrawingResourceManager(CanvasSize(
    width: UIScreen.screenWidth,
    height: UIScreen.screenHeight))
  
  private var _mainViewUseCase: MainViewUseCase?
  var mainViewUseCase: MainViewUseCase {
    MainViewUseCase(
      squareFactory: squareFactory,
      squareManager: squareManager,
      vectorFactory: vectorFactory,
      vectorManager: vectorManager
    )
  }
  
  // TODO: - 중복되는 코드를 해결할 방안이 필요. 메타타입을 고려하는 중.
  private var _squareFactory: SquareFactory?
  var squareFactory: SquareFactory {
    guard let _squareFactory else {
      let factory = SquareFactory(manager)
      _squareFactory = factory
      return factory
    }
    
    return _squareFactory
  }
  
  private var _vectorFactory: VectorFactory?
  var vectorFactory: VectorFactory {
    guard let _vectorFactory else {
      let factory = VectorFactory(manager)
      _vectorFactory = factory
      return factory
    }
    
    return _vectorFactory
  }
  
  private var _squareManager: SquareManager?
  var squareManager: SquareManager {
    guard let _squareManager else {
      let m = SquareManager(manager)
      _squareManager = m
      return m
    }
    
    return _squareManager
  }
  
  private var _vectorManager: VectorManager?
  var vectorManager: VectorManager {
    guard let _vectorManager else {
      let m = VectorManager(manager)
      _vectorManager = m
      return m
    }
    
    return _vectorManager
  }
}
