//
//  Drawable.swift
//  DrawingApp
//
//  Created by 안상희 on 11/8/23.
//

import UIKit

protocol Drawable {
  var color: UIColor { get }
  var id: UUID { get }
  var point: Point { get }
}
