//
//  DrawingAppTests.swift
//  DrawingAppTests
//
//  Created by elly on 11/4/23.
//

import XCTest
@testable import DrawingApp

final class DrawingAppTests: XCTestCase {
    let viewModel = ViewModel()
    
    func test_사각형_그리기() {
        let point = [CGPoint(x: 100, y: 100)]
        let rectanglePosition = RectanglePosition(points: point)
        viewModel.setPosition(rectanglePosition)
        XCTAssertTrue(!viewModel.shapeInfoList.isEmpty)
    }
    
    func test_드로잉_그리기() {
        let points = [(99.0, 536.0), (98.0, 526.3333282470703), (98.0, 521.6666564941406), (98.0, 519.3333282470703), (98.0, 517.0), (98.66665649414062, 512.6666564941406), (100.33332824707031, 508.0), (103.0, 503.0), (106.66665649414062, 496.3333282470703), (110.0, 488.6666564941406), (113.66665649414062, 480.3333282470703), (116.33332824707031, 472.3333282470703), (118.66665649414062, 463.3333282470703), (121.66665649414062, 455.0), (125.0, 447.0), (128.66665649414062, 439.0), (132.3333282470703, 431.0), (136.66665649414062, 423.3333282470703), (140.3333282470703, 416.0), (144.0, 408.6666564941406), (147.0, 401.6666564941406), (148.3333282470703, 395.3333282470703), (148.66665649414062, 390.0), (148.66665649414062, 385.0), (149.3333282470703, 380.3333282470703), (152.0, 375.3333282470703), (155.66665649414062, 370.6666564941406), (160.0, 366.3333282470703), (165.66665649414062, 362.0), (170.0, 357.6666564941406), (173.3333282470703, 353.3333282470703), (175.66665649414062, 348.6666564941406), (177.0, 344.3333282470703), (178.3333282470703, 340.3333282470703), (179.3333282470703, 337.0), (180.0, 334.6666564941406), (180.66665649414062, 332.3333282470703), (181.3333282470703, 331.3333282470703), (184.3333282470703, 328.3333282470703)]
            .compactMap { CGPoint(x: $0.0, y: $0.1)}
        let rectanglePosition = DrawingPosition(points: points)
        viewModel.setPosition(rectanglePosition)
        XCTAssertTrue(!viewModel.drawingInfoList.isEmpty)
    }
}
