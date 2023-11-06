//
//  UIView+Extensions.swift
//  DrawingApp
//
//  Created by 안상희 on 11/5/23.
//

import UIKit

extension UIView {
  func addSubviews(_ views: [UIView]) {
    for view in views {
      self.addSubview(view)
    }
  }
}
