//
//  SquareSelectionUseCase.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import Foundation

final class SquareSelectionUseCase: SquareSelectionType {

    private var selectedSquare: Square?

     func selectSquare(_ square: inout Square) {
         if var selectedSquare = selectedSquare {
             deselectSquare(&selectedSquare)
         }

         square.isSelected = true
         selectedSquare = square
     }

     func deselectSquare(_ square: inout Square) {
         square.isSelected = false

         if let selectedSquare = selectedSquare,
            selectedSquare == square {
             self.selectedSquare = nil
         }
     }
}
