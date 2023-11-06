//
//  SquareSelectionUseCaseImpl.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import Foundation

final class SquareSelectionUseCaseImpl: SquareSelectionUseCase {
    func selectSquare(_ square: inout Square) {
        square.isSelected = true
    }

    func deselectSquare(_ square: inout Square) {
        square.isSelected = false
    }
}
