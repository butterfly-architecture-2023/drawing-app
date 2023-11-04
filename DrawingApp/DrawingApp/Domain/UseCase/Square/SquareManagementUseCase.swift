//
//  SquareManagementUseCase.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import Foundation

// MARK: Square 데이터 관리
final class SquareManagementUseCase: SquareManagementType {

    private var squares: [Square] = []

    func createSquare(within maxPosition: Position) -> Square {
        // Color
        let allCases = ColorType.allCases
        let randomIndex = Int.random(in: 0..<allCases.count)
        let randomColor = allCases[randomIndex]

        // Position
        let randomX = CGFloat.random(in: 0...maxPosition.x)
        let randomY = CGFloat.random(in: 0...maxPosition.y)
        let position = Position(x: randomX, y: randomY)

        let square = Square(
            id: UUID().hashValue,
            color: randomColor, 
            position: position
        )
        squares.append(square)
        return square
    }
}
