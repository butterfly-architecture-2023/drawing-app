//
//  SquareFactory.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/07.
//

import Foundation

protocol SquareFactory {
    func makeComponent(in rect: CGRect) -> Drawable?
    func filteredClick(touchPoint: CGPoint, squares: [Drawable]) -> Drawable?
}
