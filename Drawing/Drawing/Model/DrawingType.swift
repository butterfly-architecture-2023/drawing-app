//
//  DrawingModels.swift
//  Drawing
//
//  Created by ByungHoon Ann on 2023/11/13.
//

protocol DrawingInformation {
    var id: String { get }
    var rect:  DrawingRect { get }
    var color: DrawingRGB { get }
    var drawingType: DrawingType { get }
    var path: DrawingBezierPath? { get }
    var isMine: Bool { get }
}

struct DrawingInfo: DrawingInformation, Codable {
    let id: String
    let rect: DrawingRect
    let color: DrawingRGB
    let drawingType: DrawingType
    let path: DrawingBezierPath?
    let isMine: Bool
    
    init(id: String,
         rect: DrawingRect = .zero,
         color: DrawingRGB,
         drawingType: DrawingType,
         path: DrawingBezierPath? = nil,
         isMine: Bool = true) {
        self.id = id
        self.rect = rect
        self.color = color
        self.drawingType = drawingType
        self.path = path
        self.isMine = isMine
    }
}

struct DrawingRect: Codable {
    let x: Float
    let y: Float
    let width: Float
    let height: Float
    
    var point: DrawPoint {
        return DrawPoint(x: x, y: y)
    }
    
    static var zero: DrawingRect {
        return DrawingRect(x: 0, y: 0, width: 0, height: 0)
    }
}

struct DrawPoint{
    let x: Float
    let y: Float
}

struct DrawingRGB: Codable {
    let red: Float
    let blue: Float
    let green: Float
    let alpha: Float
    
    static var clear: DrawingRGB {
        return DrawingRGB(red: 0, blue: 0, green: 0, alpha: 0)
    }
}

enum DrawingType: Codable {
    case rectangle
    case line
}

