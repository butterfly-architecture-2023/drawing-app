//
//  DrawingAppTests.swift
//  DrawingAppTests
//
//  Created by elly on 11/4/23.
//

import XCTest
@testable import DrawingApp

final class DrawingAppTests: XCTestCase {
    
    func test_사각형_그리기() {
        let canvasView = CanvasView()
        canvasView.updateMode(.rectangle)
        XCTAssertEqual(canvasView.shapeInfoList.isEmpty, false)
    }
    
    // FIXME: - 터치를 받아서 그림을 그려야 drawingInfoList에 값이 들어가는데, 값을 임의로 넣으려 했으나 실패함..
//    func test_그림_그리기() {
//        let canvasView = CanvasView()
//        canvasView.accessibilityIdentifier = "canvas_view"
//        canvasView.updateMode(.drawing)
//        
//        let app = XCUIApplication()
//        let canvasViewElements = app.otherElements["canvas_view"]
//        let startCoordinate = canvasViewElements.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
//        let endCoordinate = canvasViewElements.coordinate(withNormalizedOffset: CGVector(dx: 1, dy: 1))
//        startCoordinate.press(forDuration: 0, thenDragTo: endCoordinate)
//        
//        XCTAssertEqual(canvasView.drawingInfoList.isEmpty, false)
//    }
}
