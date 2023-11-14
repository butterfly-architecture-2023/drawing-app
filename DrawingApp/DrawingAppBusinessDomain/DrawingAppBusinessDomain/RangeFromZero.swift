//
//  RangeFromZero.swift
//  DrawingAppBusinessDomain
//
//  Created by 백상휘 on 2023/11/14.
//

import Foundation

@propertyWrapper
public struct RangeFromZero {
  private var _value: Double
  public var wrappedValue: Double {
    get { _value }
    set {
      if newValue >= 0 {
        _value = newValue
      }
    }
  }
  
  public init(wrappedValue initialValue: Double) {
    self._value = initialValue
  }
}
