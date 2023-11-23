//
//  DrawingUseCaseTests.swift
//  DrawingTests
//
//  Created by ByungHoon Ann on 2023/11/15.
//

import XCTest
@testable import Drawing

class DrawUseCaseTests: XCTestCase {
    var drawUseCase: DrawingUseCase!
    var canvasRect: DrawingRect!

    override func setUp() {
        drawUseCase = DrawingUseCaseImpl()
        canvasRect = DrawingRect(x: 0, y: 0, width: 1000, height: 1000)
        super.setUp()
    }

    override func tearDown() {
        drawUseCase = nil
        canvasRect = nil
        super.tearDown()
    }
    
    func test_UseCase에서_사각형이_제대로_제작되는가() {
        let drawingInfo = drawUseCase.makeRectangle(drawRect: canvasRect)
        
        XCTAssertNotNil(drawingInfo.id)
        XCTAssertEqual(drawingInfo.drawingType, .rectangle)
    }
    
    func test_UseCase에서_선그리기가_제대로_제작되는가() {
        let drawPoint1 = DrawPoint(x: 10, y: 20)
        let drawPoint2 = DrawPoint(x: 30, y: 40)
        let drawPoint3 = DrawPoint(x: 50, y: 60)
        drawUseCase.startDraw(drawPoint: drawPoint1)
        let drawingInfo1 = drawUseCase.makingDraw(drawPoint: drawPoint2)
        let drawingInfo2 = drawUseCase.makingDraw(drawPoint: drawPoint3)
        let endDrawingInfo = drawUseCase.endDraw()
        
        XCTAssertNotNil(drawingInfo1.path)
        XCTAssertNotNil(drawingInfo2.path)
        XCTAssertEqual(endDrawingInfo.drawingType, .line)
    }

    
    func test_사각형과_선그리기_두개다_성공하는가() {
        // Given
        let drawPoint1 = DrawPoint(x: 10, y: 20)
        let drawPoint2 = DrawPoint(x: 30, y: 40)
        let drawPoint3 = DrawPoint(x: 50, y: 60)
        
        let rectangleInfo = drawUseCase.makeRectangle(drawRect: canvasRect)
        drawUseCase.startDraw(drawPoint: drawPoint1)
        
        let drawingInfo1 = drawUseCase.makingDraw(drawPoint: drawPoint2)
        let drawingInfo2 = drawUseCase.makingDraw(drawPoint: drawPoint3)
        let endDrawingInfo = drawUseCase.endDraw()
        
        XCTAssertNotNil(rectangleInfo.id)
        XCTAssertEqual(rectangleInfo.drawingType, .rectangle)
        
        XCTAssertNotNil(drawingInfo1.path)
        XCTAssertNotNil(drawingInfo2.path)
        XCTAssertEqual(endDrawingInfo.drawingType, .line)
    }
}
