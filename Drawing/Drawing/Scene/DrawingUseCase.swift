//
//  DrawUseCase.swift
//  Drawing
//
//  Created by ByungHoon Ann on 2023/11/12.
//

import UIKit

protocol DrawingUseCase {
    func makeRectangle(drawRect: DrawingRect) -> DrawingInfo
    func startDraw(drawPoint: DrawPoint)
    func makingDraw(drawPoint: DrawPoint) -> DrawingInfo
    func endDraw() -> DrawingInfo
}

struct DrawingBezierPath: Codable {
    let path: UIBezierPathProtocol
    
    init(path: UIBezierPathProtocol) {
        self.path = path
    }
    
    enum CodingKeys: String, CodingKey {
        case bezierPathData
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let bezierPathData = try container.decodeIfPresent(Data.self, forKey: .bezierPathData) {
            let path = BezierPathManager.unarchive(from: bezierPathData)
            self.path = path ?? UIBezierPath()
        } else {
            self.path = UIBezierPath()
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let pathData = BezierPathManager.archive(path)
        try container.encode(pathData, forKey: .bezierPathData)
    }
}

class DrawingUseCaseImpl: DrawingUseCase {
    
    private let width: Float = 100
    private let height: Float = 100
    private var drawingBezierPath: UIBezierPathProtocol = UIBezierPath()
    
    func makeDrawingPath() -> DrawingBezierPath {
        return DrawingBezierPath(path: drawingBezierPath)
    }
    
    func makeRectangle(drawRect: DrawingRect) -> DrawingInfo {
        return DrawingInfo(id: makeDrawingID(),
                           rect: makeRectangleFrame(drawRect: drawRect),
                           color: makeRandomColor(),
                           drawingType: .rectangle)
    }
    
    func startDraw(drawPoint: DrawPoint) {
        drawingBezierPath = UIBezierPath()
        drawingBezierPath.accessibilityLabel = makeDrawingID()
        drawingBezierPath.move(to: drawPoint)
    }
    
    func makingDraw(drawPoint: DrawPoint) -> DrawingInfo {
        drawingBezierPath.addLine(to: drawPoint)
        return DrawingInfo(id: drawingBezierPath.accessibilityLabel ?? "",
                           color: .clear,
                           drawingType: .line,
                           path: makeDrawingPath())
    }
    
    func endDraw() -> DrawingInfo {
        return DrawingInfo(id: drawingBezierPath.accessibilityLabel ?? "",
                           color: .clear,
                           drawingType: .line,
                           path: makeDrawingPath())
    }
    
    private func makeRandomColor() -> DrawingRGB {
        let color = UIColor.randomColor
        guard color != UIColor.systemRed else { return makeRandomColor() }
        return color.drawingColor()
    }
    
    private func makeRectangleFrame(drawRect: DrawingRect) -> DrawingRect {
        let maxWidth = drawRect.width - 100
        let maxHeight = drawRect.height - 100
        let originX = Float.random(in: 0...maxWidth)
        let originY = Float.random(in: 0...maxHeight)
        
        return DrawingRect(x: originX, y: originY, width: width, height: height)
    }
    
    private func makeDrawingID() -> String {
        return UUID().uuidString
    }
}
