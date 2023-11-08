//
//  RandomRectangleFactoryTest.swift
//  drawing-appTests
//
//  Created by 박진섭 on 11/7/23.
//

import XCTest
@testable import drawing_app

final class RandomRectangleFactoryTest: XCTestCase {
    var sut: RandomRectangleFactory!

    func test_정해진_바운더리에_사이즈가_100인_사각형이_생기는가() throws {
        sut = .init()
        let rectangle_1 = sut.make(in: .init(maxXPosition: 100, maxYPostiion: 100))
        let rectangle_2 = sut.make(in: .init(maxXPosition: 200, maxYPostiion: 200))
        let rectangle_3 = sut.make(in: .init(maxXPosition: 300, maxYPostiion: 300))
        let rectangle_4 = sut.make(in: .init(maxXPosition: 400, maxYPostiion: 400))

        [rectangle_1, rectangle_2, rectangle_3, rectangle_4].forEach {
            XCTAssertTrue($0.width == 100)
            XCTAssertTrue($0.height == 100)
        }

        XCTAssertTrue(rectangle_1.x == 0)
        XCTAssertFalse(rectangle_1.x != 0 )
        XCTAssertTrue(rectangle_1.y == 0)
        XCTAssertFalse(rectangle_1.y != 0)

        XCTAssertTrue(rectangle_2.x <= 100)
        XCTAssertFalse(rectangle_2.x > 100)
        XCTAssertTrue(rectangle_2.y <= 100)
        XCTAssertFalse(rectangle_2.y > 100)

        XCTAssertTrue(rectangle_2.x <= 200)
        XCTAssertFalse(rectangle_2.x > 200)
        XCTAssertTrue(rectangle_2.y <= 200)
        XCTAssertFalse(rectangle_2.y > 200)

        XCTAssertTrue(rectangle_2.x <= 300)
        XCTAssertFalse(rectangle_2.x > 300)
        XCTAssertTrue(rectangle_2.y <= 300)
        XCTAssertFalse(rectangle_2.y > 300)


    }
}
