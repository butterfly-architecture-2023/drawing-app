//
//  RectangleTests.swift
//  SwiftDrawingAppTests
//
//  Created by Han Songe on 2023/11/09.
//

import XCTest

final class RectangleTests: XCTestCase {
    var rectangle: Rectangle!
    
    override func setUpWithError() throws {
        rectangle = Rectangle(origin: CGPoint(x: 0.0, y: 0.0), size: CGSize(width: 100.0, height: 100.0), fillColor: .systemBlue)
    }
    
    func test_rectangle_frame() {
        let frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        XCTAssertEqual(rectangle.frame(), frame)
    }
    
    func test_rectangle_addLineToPoints() {
        let points = rectangle.addLineToPoints()
        XCTAssertEqual(points, [
            CGPoint(x: 100.0, y: 0.0),
            CGPoint(x: 100.0, y: 100.0),
            CGPoint(x: 0.0, y: 100.0),
        ])
    }
    
    func test_rectangle_select() {
        XCTAssertTrue(rectangle.setSelected())
    }
    
    func test_rectangle_deselect() {
        rectangle.setSelected()
        XCTAssertFalse(rectangle.setSelected())
    }
}
