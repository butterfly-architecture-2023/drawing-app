//
//  ViewModel.swift
//  DrawingApp
//
//  Created by elly on 11/14/23.
//

import Foundation
import CoreGraphics

class ViewModel {
    
    // MARK: - Properties
    
    private(set) var mode: DrawingButtonType = .rectangle {
        didSet {
            updateUserInteractionEnable(mode)
        }
    }
    
    private(set) var shapeInfoList: [Rectangle] = [] {
        didSet {
            refreshCanvas(ShapeInfo(graphicsInfo: shapeInfoList))
        }
    }
    private(set )var drawingInfoList: [Drawing] = [] {
        didSet {
            refreshCanvas(DrawingInfo(graphicsInfo: drawingInfoList))
        }
    }
    
    
    // MARK: - input (VC -> VM)
    
    func setPosition(_ info: PositionProtocol) {
        if info is DrawingPosition, mode == .drawing {
            let color = CGColor.random(without: .red)
            let drawing = Drawing(color: color, points: info.points)
            drawingInfoList.append(drawing)
            print(drawingInfoList)
        } else if info is RectanglePosition, mode == .rectangle {
            let color = CGColor.random(without: .red)
            let rectangle = Rectangle(color: color, points: info.points)
            shapeInfoList.append(rectangle)
            print(shapeInfoList)
        }
    }
    
    func updateMode(_ type: DrawingButtonType) {
        mode = type
        if type == .rectangle {
            let randomPosition = CGPoint.random(in: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 300, height: 500)))
            let position = RectanglePosition(points: [randomPosition])
            setPosition(position)
        }
    }
    
    
    // MARK: - output (VM -> VC)
    
    var refreshCanvas: (any GraphicsProvider) -> Void = { _ in }
    
    var updateUserInteractionEnable: (DrawingButtonType) -> Void = { _ in }
    
    
    // TODO: - 사각형 모드이고, 유저 선택 좌표값에 사각형이 존재하면 선택여부를 체킹하고, 빨간색으로 색상 변경하도록 함
    private func changeRectangleColor() {
        
    }
}

