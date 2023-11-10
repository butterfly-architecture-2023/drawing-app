//
//  Drawable.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/08.
//

import Foundation
import UIKit

protocol Drawable {
    var id: String { get }
    var points: [CGPoint] { get }
    var foregroundColor: UIColor { get }
}
