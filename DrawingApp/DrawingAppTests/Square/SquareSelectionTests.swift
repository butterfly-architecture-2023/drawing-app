//
//  SquareSelectionTests.swift
//  DrawingAppTests
//
//  Created by 강호성 on 11/5/23.
//

import XCTest
@testable import DrawingApp

final class SquareSelectionTests: XCTestCase {

    var useCase: SquareSelectionUseCase!

    override func setUp() {
        super.setUp()
        useCase = SquareSelectionUseCaseImpl()
    }

    override func tearDown() {
        useCase = nil
        super.tearDown()
    }

    func test_사각형_선택() {
        var square = Square(id: 1, color: .cyan, position: Position(x: 100, y: 100))
        useCase.selectSquare(&square)

        XCTAssertTrue(square.isSelected)
    }

    func test_사각형_선택_해제() {
        var square = Square(id: 1, color: .cyan, position: Position(x: 100, y: 100))
        useCase.selectSquare(&square)
        useCase.deselectSquare(&square)

        XCTAssertFalse(square.isSelected)
    }
}
