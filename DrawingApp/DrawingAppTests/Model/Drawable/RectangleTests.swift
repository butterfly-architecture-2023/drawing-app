//
//  RectangleTests.swift
//  DrawingAppTests
//
//  Created by 현기엽 on 2023/11/06.
//

import XCTest
@testable import DrawingApp

final class RectangleTests: XCTestCase {
    func test_select를_하면_border_가_빨간색으로_변경된다() {
        let rectangle = Rectangle(rect: .zero, borderColor: nil, fillColor: nil)
        let sut = rectangle.selected()
        XCTAssertEqual(sut.foregroundColor, Color(uiColor: .systemRed))
    }
    
    func test_deselect를_하면_border_가_nil로_변경된다() {
        let rectangle = Rectangle(rect: .zero, borderColor: Color.init(red: 0.0, green: 1.0, blue: 0.0), fillColor: nil)
        let sut = rectangle.deselected()
        XCTAssertEqual(sut.foregroundColor?.uiColor, nil)
    }
    
    func test_select후_deselect하면_border가_nil로_변경된다() {
        let rectangle = Rectangle(rect: .zero, borderColor: nil, fillColor: nil)
        let sut = rectangle.selected().deselected()
        XCTAssertEqual(sut.foregroundColor?.uiColor, nil)
    }
}
