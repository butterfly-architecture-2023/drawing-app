//
//  DrawingUseCaseImpl.swift
//  DrawingApp
//
//  Created by 강호성 on 11/5/23.
//

import Foundation

final class DrawingUseCaseImpl: DrawingUseCase {

    private var currentColor: ColorType?
    private var currentCoordinates: [CGPoint] = []
    private var drawings: [Drawing] = []

    func startDrawing(at point: CGPoint) {
        let allCases = ColorType.allCases
        let randomIndex = Int.random(in: 0..<allCases.count)
        let randomColor = allCases[randomIndex]
        currentColor = randomColor

        currentCoordinates = [point]
    }

    func continueDrawing(to point: CGPoint) {
        currentCoordinates.append(point)
    }

    func endDrawing() {
        if let color = currentColor {
            let drawing = Drawing(
                id: UUID().hashValue,
                color: color,
                coordinates: currentCoordinates
            )
            drawings.append(drawing)
        }

        currentColor = nil
        currentCoordinates = []
    }

    func readDrawings() -> [Drawing] {
        return drawings
    }

    func readCurrentColor() -> ColorType? {
        return currentColor
    }

    func readCurrentCoordinates() -> [CGPoint] {
        return currentCoordinates
    }
}
