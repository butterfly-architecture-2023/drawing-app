//
//  Graphics.swift
//  DrawingApp
//
//  Created by elly on 11/14/23.
//

import Foundation
import CoreGraphics

typealias GraphicsProtocol = RectangleProtocol & DrawingProtocol

protocol Identifiable {
    var id: UUID { get }
}

protocol Colored {
    var color: CGColor { get set }
}

protocol Pointable {
    var points: [CGPoint] { get set }
}

protocol RectangleProtocol: Identifiable, Colored, Pointable {
    var isSelected: Bool { get set }
    func topLeftPoint() -> CGPoint
}

protocol DrawingProtocol: Identifiable, Colored, Pointable { }
