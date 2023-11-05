//
//  DrawingUseCase.swift
//  DrawingApp
//
//  Created by 강호성 on 11/5/23.
//

import Foundation

protocol DrawingUseCase {
    func startDrawing(at point: CGPoint)
    func continueDrawing(to point: CGPoint)
    func endDrawing()

    func readDrawings() -> [Drawing]
    func readCurrentColor() -> ColorType?
    func readCurrentCoordinates() -> [CGPoint]
}
