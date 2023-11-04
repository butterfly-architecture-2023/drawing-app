//
//  CanvasViewModel.swift
//  DrawingApp
//
//  Created by 현기엽 on 2023/11/04.
//

import UIKit
import Combine

final class CanvasViewModel {
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
        canvas.add(Rectangle(rect: rect, borderColor: nil, fillColor: Color(uiColor: UIColor.random)))
    }
}
