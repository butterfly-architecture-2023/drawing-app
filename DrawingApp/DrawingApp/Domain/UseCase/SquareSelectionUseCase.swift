//
//  SquareSelectionUseCase.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import Foundation

protocol SquareSelectionUseCase {
    func selectSquare(_ square: inout Square)
    func deselectSquare(_ square: inout Square)
    func readSelectedSquare() -> Square?
}
