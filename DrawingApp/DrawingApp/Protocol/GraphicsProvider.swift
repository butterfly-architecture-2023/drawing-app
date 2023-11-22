//
//  GraphicsProvider.swift
//  DrawingApp
//
//  Created by elly on 11/23/23.
//

import Foundation

protocol GraphicsProvider {
    associatedtype GraphicsType
    var graphicsInfo: [GraphicsType] { get set }
    func draw()
}
