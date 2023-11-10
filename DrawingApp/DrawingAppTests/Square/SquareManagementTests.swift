//
//  SquareManagementTests.swift
//  DrawingAppTests
//
//  Created by 강호성 on 11/5/23.
//

import XCTest
@testable import DrawingApp

final class SquareManagementTests: XCTestCase {

    var useCase: SquareManagementUseCase!

    override func setUp() {
        super.setUp()
        useCase = SquareManagementUseCaseImpl()
    }

    override func tearDown() {
        useCase = nil
        super.tearDown()
    }

    func test_사각형의_위치가_유효한지_검증() {
        let maxPosition = Position(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height)
        let square = useCase.createSquare(within: maxPosition)

        XCTAssert(square.position.x >= 0 && square.position.x <= maxPosition.x)
        XCTAssert(square.position.y >= 0 && square.position.y <= maxPosition.y)
    }

    func test_사각형_업데이트_이후_변경_값이_저장되었는지() {
        let maxPosition = Position(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height)
        var square = useCase.createSquare(within: maxPosition)

        square.color = .cyan
        square.position = Position(x: 100, y: 100)

        useCase.updateSquare(square)

        let updatedSquare = useCase.readSquare(id: square.id)

        XCTAssertEqual(updatedSquare, square)
    }
}
