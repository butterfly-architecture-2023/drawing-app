//
//  CanvasViewModel.swift
//  DrawingApp
//
//  Created by 오킹 on 2023/11/14.
//

import Foundation

final class CanvasViewModel {
    
    private let canvas = Canvas()
    private(set) var points: [CGPoint] = []
        
}

// 입력
extension CanvasViewModel {
    func startDrawing(from point: CGPoint) {
        self.points = [point]
    }
    
    func updateDrawing(to point: CGPoint) {
        self.points.append(point)
    }
    
    func endDrawing() {
        let drawingPoints = self.points
        canvas.add(drawing: .init(points: drawingPoints, lineWidth: 5.0))
        
        self.points.removeAll()
    }
    
    func selectRectangle(id: UUID) -> Bool {
        if let rectangle = canvas.rectangles.first(where: { $0.id == id }) {
            canvas.select(rectangle: rectangle)
            
            return true
        }
        
        return false
    }
    
    func deselectRectangle(id: UUID) -> Bool {
        if let rectangle = canvas.rectangles.first(where: { $0.id == id }) {
            canvas.deselect(rectangle: rectangle)
            
            return true
        }
        
        return false
    }
}

// 출력
extension CanvasViewModel {
    func drawRectangle(maxX: CGFloat, maxY: CGFloat) -> Rectangle {
        
        let rectangle = Rectangle(rect: rectangleRandomCGRect(maxX: maxX, maxY: maxY),
                                  backgroundColor: .random())
        canvas.add(rectangle: rectangle)
        
        return rectangle
    }
    
    func drawLine() -> Drawing? {
        guard points.count >= 2 else { return nil }
        guard let currentPoint = points.last else { return nil }
        let beforePoint = points[points.count - 2]
        
        let drawing = Drawing(points: [beforePoint, currentPoint], lineWidth: 5.0)
        
        return drawing
    }
    
    private func rectangleRandomCGRect(maxX: CGFloat, maxY: CGFloat) -> CGRect {
        let size = CGSize(width: Rectangle.width, height: Rectangle.height)
        
        let maxWidth = maxX
        let maxHeight = maxY

        let origin = CGPoint(x: CGFloat.random(in: 0...maxWidth),
                             y: CGFloat.random(in: 0...maxHeight))
        
        return CGRect(origin: origin, size: size)
    }
}
