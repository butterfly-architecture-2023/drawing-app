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
    
    private(set) var mode: DrawingButtonType = .rectangle
    
    var shapeInfoList: [Rectangle] = [] {
        didSet {
            refreshCanvas(ShapeInfo(graphicsInfo: shapeInfoList))
        }
    }
    var drawingInfoList: [Drawing] = [] {
        didSet {
            refreshCanvas(DrawingInfo(graphicsInfo: drawingInfoList))
        }
    }
    
    
    // input (VC -> VM)
    
    // PositionProtocol로 좌표값 받아옴
    // 사각형 버튼 눌렸을 때, 터치 좌표 받아올 때, 사각형위치 클릭 받아올 때
    func setPosition(_ info: PositionProtocol) {
        if info is DrawingPosition {
            let color = CGColor.random(without: .red)
            let drawing = Drawing(color: color, points: info.points)
            drawingInfoList.append(drawing)
            print(drawingInfoList)
        } else if info is RectanglePosition {
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
    
    
    // output (VM -> VC)
    
    // 사각형 모드이고, 유저 선택 좌표값에 사각형이 존재하면 선택여부를 체킹하고, 빨간색으로 색상 변경하도록 함
    //    var shapeColor: (RectanglePosition) -> Void = { _ in }
    
    // input event가 있을 때마다 화면 새로고침 - Graphics 값 함께 넘김
                          
    var refreshCanvas: (any GraphicsProvider) -> Void = { _ in }
    
    //    사각형 모드이고, 유저 선택 좌표값에 사각형이 존재하면 선택여부를 체킹하고, 빨간색으로 색상 변경하도록 함
    private func changeRectangleColor() {
        // ToDo..
    }    
}

