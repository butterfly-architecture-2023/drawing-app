//
//  RectangleViewModelTest.swift
//  drawing-appTests
//
//  Created by 박진섭 on 11/8/23.
//

import XCTest
import Combine
@testable import drawing_app

final class RectangleViewModelTest: XCTestCase {
    var sut: RectangleViewModel!
    var subscriptions = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        sut = .init()
    }

    override func tearDown() {
        subscriptions = []
        super.tearDown()
    }

    func test_addRandomRectangle_정해진_크기와_바운더리에_랜덤한_사각형을_만들어_추가하는가()  {
        let boundary = Boundary(maxXPosition: 100, maxYPostiion: 100)

        let _ = sut.addedRectangle
            .sink { newRectangle in
                XCTAssertTrue(newRectangle.width == 100)
                XCTAssertTrue(newRectangle.height == 100)
                print(newRectangle.x)
                print(newRectangle.y)
                XCTAssertTrue(newRectangle.x == 0)
                XCTAssertTrue(newRectangle.y == 0)
                XCTAssertFalse(newRectangle.x != 0)
                XCTAssertFalse(newRectangle.y != 0)
            }
            .store(in: &subscriptions)
        
        sut.addRandomRectangle(in: boundary)
    }

    func test_changeSelectedRectangleRGBA_선택_유무에_따라서_RGBA값을_변경하는가() {
        let redBorderRGBA = RGBA(red: 1, green: 0, blue: 0, alpha: 1)
        let emptyBorderRGBA = RGBA(red: 0, green: 0, blue: 0, alpha: 0)
        let rectangleID = 10
        // 새로 선택이 되었을때 red border
        let subscriber_1 = sut.selectedRectangleBorderColor
            .sink { rgba in
                XCTAssertTrue(rgba == redBorderRGBA)
            }
        sut.changeSelectedRectangleRGBA(rectangleID)
        
        subscriber_1.cancel()

        // 기존의 사각형을 한번더 선택 했을때 empty border
        let _ = sut.selectedRectangleBorderColor
            .sink { rgba in
                XCTAssertTrue(rgba == emptyBorderRGBA)
            }
        sut.changeSelectedRectangleRGBA(rectangleID)
    }

}
