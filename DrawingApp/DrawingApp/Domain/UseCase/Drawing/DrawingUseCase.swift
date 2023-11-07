//
//  DrawingUseCase.swift
//  DrawingApp
//
//  Created by 강호성 on 11/5/23.
//

import Foundation

import RxCocoa
import RxSwift

protocol DrawingUseCase {
    func startDrawing(at point: CGPoint)
    func continueDrawing(to point: CGPoint)
    func endDrawing(color: ColorType?, coordinates: [CGPoint])

    func readCurrentColor() -> BehaviorRelay<ColorType?>
    func readCurrentCoordinates() -> BehaviorRelay<[CGPoint]>
    func readDrawings() -> BehaviorRelay<[Drawing]>
}
