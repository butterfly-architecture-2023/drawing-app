//
//  LineManager.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/09.
//

import Foundation

protocol LineManager {
    func startDraw(in point: CGPoint) -> Line?
}
