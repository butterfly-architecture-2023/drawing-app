//
//  SquareFactoryImpl.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/08.
//

import Foundation

class SquareFactoryImpl: SquareFactory {

    init() { }
    
    func makeComponent(in rect: CGRect) -> Drawable? {
        let minX = CGFloat.random(in: rect.origin.x..<rect.width-100)
        let minY = CGFloat.random(in: rect.origin.y..<rect.height-100)
        
        let points: [CGPoint] = [CGPoint(x: minX, y: minY), CGPoint(x: minX + 100, y: minY), CGPoint(x: minX + 100, y: minY + 100), CGPoint(x: minX, y: minY + 100)]
        
        return Square(points: points)
    }
}
