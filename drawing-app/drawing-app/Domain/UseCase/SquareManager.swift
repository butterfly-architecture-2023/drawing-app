//
//  SquareManager.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/07.
//

import Foundation

protocol SquareManager {
    func makeSquare(in rect: CGRect) -> Drawable?
    func validateClick(touchPoint: CGPoint, squares: [Drawable]) -> Drawable?
}
