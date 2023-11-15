//
//  AppElementManager.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/14.
//

import Foundation
import DrawingAppBusinessDomain

protocol AppElementManager {
  associatedtype E: ElemInView
  associatedtype Action: RawRepresentable
  
  var manager: DrawingResourceManager { get }
  func makeChange(_ elem: E) -> E
  
  init(_ manager: DrawingResourceManager)
}
