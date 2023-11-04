//
//  SquareSelectionType.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import Foundation

protocol SquareSelectionType {
    func selectSquare(_ square: inout Square)
    func deselectSquare(_ square: inout Square)
}
