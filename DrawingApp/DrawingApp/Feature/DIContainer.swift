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
  
  private var _selectElementUseCase: SelectSquareElementUseCase?
  var selectElementUseCase: SelectSquareElementUseCase {
    guard let _selectElementUseCase else {
      let useCase = SelectSquareElementUseCase()
      _selectElementUseCase = useCase
      return useCase
    }
    
    return _selectElementUseCase
  }
  
  private var _selectVectorUseCase: SelectVectorElementUseCase?
  var selectVectorUseCase: SelectVectorElementUseCase {
    guard let _selectVectorUseCase else {
      let useCase = SelectVectorElementUseCase()
      _selectVectorUseCase = useCase
      return useCase
    }
    
    return _selectVectorUseCase
  }
  
  private var _viewFactory: ViewFactory?
  var viewFactory: ViewFactory {
    guard let _viewFactory else {
      let factory = ViewFactory(manager)
      self._viewFactory = factory
      return factory
    }
    
    return _viewFactory
  }
  
  private var _mainViewModel: MainViewModel?
  var mainViewModel: MainViewModel {
    guard let _mainViewModel else {
      let vm = MainViewModel(
        viewFactory,
        selectElementUseCase,
        selectVectorUseCase
      )
      self._mainViewModel = vm
      return vm
    }
    
    return _mainViewModel
  }
}
