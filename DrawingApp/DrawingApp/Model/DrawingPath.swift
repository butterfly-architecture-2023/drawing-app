//
//  DrawingPath.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/05.
//

import UIKit

// 화면에 그리는 중에 사용하는 임시객체
// ViewController와 ViewModel 사이의 DTO
final class DrawingPath {
    let id = UUID()
    var points = [CGPoint]()
    
    func addPoint(_ point: CGPoint) {
        points.append(point)
    }
}
