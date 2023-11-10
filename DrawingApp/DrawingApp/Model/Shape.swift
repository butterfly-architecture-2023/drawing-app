//
//  Shape.swift
//  DrawingApp
//
//  Created by leeyeon2 on 11/4/23.
//

import Foundation
import UIKit

protocol Shape {
    var id : Int { get set }
    var x: CGFloat { get set }
    var y: CGFloat { get set }
    var height: CGFloat { get set }
    var width: CGFloat { get set }
    var color: UIColor { get set }
    var isSelected: Bool { get set }
}

// isSelected를 sender를 통해 변경하기 위해 class 타입으로 선언
class Square: Shape {
    var id: Int = 0
    var x: CGFloat = 0
    var y: CGFloat = 0
    var height: CGFloat = 100
    var width: CGFloat = 100
    var color: UIColor = .randomColor
    
    var isSelected: Bool  = false{
        // 값 변화 확인용
        didSet {
//            print("isselected is now \(isSelected ? "true" : "false")")
        }
   }
}
