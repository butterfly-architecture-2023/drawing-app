//
//  DrawingUseCaseImpl.swift
//  DrawingApp
//
//  Created by 강호성 on 11/5/23.
//

import Foundation

import RxCocoa
import RxSwift

final class DrawingUseCaseImpl: DrawingUseCase {

    private let currentColor = BehaviorRelay<ColorType?>(value: nil)
    private let currentCoordinates = BehaviorRelay<[CGPoint]>(value: [])
    private let drawings = BehaviorRelay<[Drawing]>(value: [])

    func startDrawing(at point: CGPoint) {
        let allCases = ColorType.allCases
        let randomIndex = Int.random(in: 0..<allCases.count)
        let randomColor = allCases[randomIndex]

        currentColor.accept(randomColor)
        currentCoordinates.accept([point])
    }

    func continueDrawing(to point: CGPoint) {
        let oldDatas = currentCoordinates.value
        currentCoordinates.accept(oldDatas + [point])
    }

    func endDrawing(color: ColorType?, coordinates: [CGPoint]) {
        if let color = color {
            let drawing = Drawing(
                id: UUID().hashValue,
                color: color,
                coordinates: coordinates
            )
            drawings.accept([drawing])
        }

        currentColor.accept(nil)
        currentCoordinates.accept([])
    }

    func readCurrentColor() -> BehaviorRelay<ColorType?> {
        return currentColor
    }

    func readCurrentCoordinates() -> BehaviorRelay<[CGPoint]> {
        return currentCoordinates
    }

    func readDrawings() -> BehaviorRelay<[Drawing]> {
        return drawings
    }
}
