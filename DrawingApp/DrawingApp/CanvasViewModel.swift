//
//  CanvasViewModel.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import UIKit
import Combine

final class CanvasViewModel {
    private var drawingUUID: UUID?
    
    lazy var elements: AnyPublisher<[any Drawable], Never> = {
        canvas.$elements
            .map { elements in
                Array(elements.values)
            }
            .eraseToAnyPublisher()
    }()
    
    private var canvas = Canvas()
    
    func didTapped(point: CGPoint) {
        let rect = CGRect(center: point, size: .init(width: 100, height: 100))
        canvas.update(Rectangle(rect: rect, borderColor: nil, fillColor: Color(uiColor: UIColor.random)))
    }
    
    func didDrawBegan() {
        let drawingUUID = UUID()
        canvas.update(Path(id: drawingUUID, points: [], foregroundColor: Color(uiColor: .random)))
        self.drawingUUID = drawingUUID
    }
    
    func didDraw(point: CGPoint) {
        guard let drawingUUID else { return }
        canvas.updatePathPoint(id: drawingUUID, point: Point(cgPoint: point))
    }
}
