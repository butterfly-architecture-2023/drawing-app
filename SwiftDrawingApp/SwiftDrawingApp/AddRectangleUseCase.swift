//
//  AddRectangleUseCase.swift
//  SwiftDrawingApp
//
//  Created by Han Songe on 2023/11/09.
//

import Foundation

final class AddRectangleUseCase {
    private let palette = ColorPalette()
    
    func createRectangle(in canvasRect: CGRect) -> Rectangle {
        let rectangleSize: CGSize = CGSize(width: 100.0, height: 100.0)
        let randomPosition = getRandomPosition(size: rectangleSize, in: canvasRect)
        let randomColor = palette.randomColor() ?? .systemBlue
        return Rectangle(origin: randomPosition, size: rectangleSize, fillColor: randomColor)
    }
    
    private func getRandomPosition(size: CGSize, in rect: CGRect) -> CGPoint {
        let maxX = rect.maxX - size.width
        let maxY = rect.maxY - size.height
        let randomX = CGFloat.random(in: rect.minX...maxX)
        let randomY = CGFloat.random(in: rect.minY...maxY)
        return CGPoint(x: randomX, y: randomY)
    }
}
