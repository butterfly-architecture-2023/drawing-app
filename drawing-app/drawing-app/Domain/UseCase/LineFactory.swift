//
//  LineFactory.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/09.
//

import Foundation

protocol LineFactory {
    func startDraw(in point: CGPoint) -> Line?
}
