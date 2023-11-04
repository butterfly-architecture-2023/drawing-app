//
//  SquareManagementType.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import Foundation

protocol SquareManagementType {
    func createSquare(within maxPosition: Position) -> Square
}
