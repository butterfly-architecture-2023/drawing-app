//
//  SquareManagementUseCase.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import Foundation

protocol SquareManagementUseCase {
    func createSquare(within maxPosition: Position) -> Square
    func readSquare(id: Int) -> Square?
    func updateSquare(_ square: Square)
}
