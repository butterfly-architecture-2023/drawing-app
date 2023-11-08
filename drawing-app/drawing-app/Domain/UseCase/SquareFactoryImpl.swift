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
    
    func filteredClick(touchPoint: CGPoint, squares: [Drawable]) -> Drawable? {
        var selectable: Drawable?
        squares.forEach { square in
            let x = square.points.map({ $0.x })
            let y = square.points.map({ $0.y })
            
            let minX = x.min() ?? 0
            let maxX = x.max() ?? 0
            let minY = y.min() ?? 0
            let maxY = y.max() ?? 0
            
            if (minX...maxX).contains(touchPoint.x) && (minY...maxY).contains(touchPoint.y) {
                selectable = square
            }
        }
        return selectable
    }
}
