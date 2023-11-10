//
//  ColorTests.swift
//  DrawingAppTests
//
//  Created by 현기엽 on 2023/11/04.
//

import XCTest
@testable import DrawingApp

final class ColorTests: XCTestCase {
    func test빨간색은_1_0_0_으로_구성되어_있다() {
        let sut = Color(uiColor: UIColor.red)
        XCTAssertEqual(sut?.red, 1.0)
        XCTAssertEqual(sut?.green, 0.0)
        XCTAssertEqual(sut?.blue, 0.0)
    }
    
    func test초록색은_0_1_0_으로_구성되어_있다() {
        let sut = Color(uiColor: UIColor.green)
        XCTAssertEqual(sut?.red, 0.0)
        XCTAssertEqual(sut?.green, 1.0)
        XCTAssertEqual(sut?.blue, 0.0)
    }
    
    func test파란색은_0_0_1_으로_구성되어_있다() {
        let sut = Color(uiColor: UIColor.blue)
        XCTAssertEqual(sut?.red, 0.0)
        XCTAssertEqual(sut?.green, 0.0)
        XCTAssertEqual(sut?.blue, 1.0)
    }
    
    func test빨간색을_UIColor로_변활할_수_있다() {
        let sut = Color(red: 1.0, green: 0.0, blue: 0.0)
        XCTAssertEqual(sut.uiColor, UIColor.red)
    }
    
    func test초록색을_UIColor로_변활할_수_있다() {
        let sut = Color(red: 0.0, green: 1.0, blue: 0.0)
        XCTAssertEqual(sut.uiColor, UIColor.green)
    }
    
    func test파란색을_UIColor로_변활할_수_있다() {
        let sut = Color(red: 0.0, green: 0.0, blue: 1.0)
        XCTAssertEqual(sut.uiColor, UIColor.blue)
    }
}
