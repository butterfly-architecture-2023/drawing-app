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
    
    var screenSize: CGRect = .zero
    
    
    // MARK: - input (VC -> VM)
    
    func setPosition(_ info: PositionProtocol) {
        if info is DrawingPosition, mode == .drawing {
            makeDrawingInfo(info)
        } else if info is RectanglePosition, mode == .rectangle {
            checkShapeInArea(info)
        }
    }
    
    func updateMode(_ type: DrawingButtonType) {
        mode = type
        
        // 사각형 랜덤 생성
        if type == .rectangle {
            makeShapeInfoRandomPosition()
        }
    }
    
    
    // MARK: - output (VM -> VC)
    
    var refreshCanvas: (any GraphicsProvider) -> Void = { _ in }
    
    var updateUserInteractionEnable: (DrawingButtonType) -> Void = { _ in }
    
    
    // TODO: - 사각형 모드이고, 유저 선택 좌표값에 사각형이 존재하면 선택여부를 체킹하고, 빨간색으로 색상 변경하도록 함
    private func changeRectangleColor() {
        
    }
    
    private func makeDrawingInfo(_ info: PositionProtocol) {
        let color = CGColor.random(without: .red)
        let drawing = Drawing(color: color, points: info.points)
        drawingInfoList.append(drawing)
    }
    
    private func makeShapeInfo(_ info: PositionProtocol) {
        let color = CGColor.random(without: .red)
        let rectangle = Rectangle(color: color, points: info.points)
        shapeInfoList.append(rectangle)
    }
    
    private func makeShapeInfoRandomPosition() {
        let randomPosition = CGPoint.random(in: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: screenSize.width, height: screenSize.height)))
        let position = RectanglePosition(points: [randomPosition])
        makeShapeInfo(position)
    }
    
    private func checkShapeInArea(_ info: PositionProtocol) {
        guard let index = shapeInfoList.firstIndex(where: { $0.topLeftPoint().isInArea(info.points) }) else { return }
        shapeInfoList[index].isSelected = (shapeInfoList[index].isSelected == true) ? false : true
    }
}

