//
//  BoardViewModel.swift
//  SwiftDrawingApp
//
//  Created by Han Songe on 2023/11/08.
//

import Foundation

final class BoardViewModel {
    private let addRectangleUseCase: AddRectangleUseCase
    
    init(addRectangleUseCase: AddRectangleUseCase) {
        self.addRectangleUseCase = addRectangleUseCase
    }
    
    func createRectangle(in canvasRect: CGRect) -> Rectangle {
        let rectangle = addRectangleUseCase.createRectangle(in: canvasRect)
        return rectangle
    }
}
