//
//  AppFactory.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/14.
//

import Foundation
import DrawingAppBusinessDomain

protocol AppFactory {
  /// Element itself
  associatedtype E: ElemInView
  /// Element's property
  associatedtype P
  
  var manager: DrawingResourceManager { get }
  var elements: [E] { get }
  func makeElements() -> E
  func makeElements(_ p: P) -> E
  
  init(_ manager: DrawingResourceManager)
}
