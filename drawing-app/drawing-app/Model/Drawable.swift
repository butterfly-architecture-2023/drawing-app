//
//  Drawable.swift
//  drawing-app
//
//  Created by 윤소희 on 2023/11/06.
//

import UIKit

protocol Drawable {
    var id: UUID { get }
    var color: UIColor { get }
}

