//
//  SquareManagerImpl.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/08.
//

import Foundation

class SquareManagerImpl: SquareManager {

    init() { }
    
    func makeSquare(in rect: CGRect) -> Drawable? {
        let minX = CGFloat.random(in: rect.origin.x..<rect.width-Constants.squareWidth)
        let minY = CGFloat.random(in: rect.origin.y..<rect.height-Constants.squareHeight)
        
        let points: [CGPoint] = [CGPoint(x: minX, y: minY), CGPoint(x: minX + Constants.squareWidth, y: minY), CGPoint(x: minX + Constants.squareWidth, y: minY + Constants.squareHeight), CGPoint(x: minX, y: minY + Constants.squareHeight)]
        
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
