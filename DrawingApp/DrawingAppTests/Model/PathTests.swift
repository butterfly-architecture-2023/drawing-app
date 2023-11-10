//
//  PathTests.swift
//  DrawingAppTests
//
//  Created by 현기엽 on 2023/11/04.
//

import XCTest
@testable import DrawingApp

final class PathTests: XCTestCase {
    func test원점에_있는_가로_세로가_100_100_인_사각형을_path로_변환할_수_있다() {
        let rect = CGRect(origin: .zero, size: .init(width: 100, height: 100))
        let sut = Path(rect: rect)
        
        XCTAssertEqual(sut.points, [
            Point(x: 0, y: 0),
            Point(x: 100, y: 0),
            Point(x: 100, y: 100),
            Point(x: 0, y: 100),
        ])
    }
    
    func test53_31위치에_있는_가로_세로가_13_25_인_사각형을_path로_변환할_수_있다() {
        let rect = CGRect(
            origin: .init(x: 53, y: 31),
            size: .init(width: 13, height: 25)
        )
        let sut = Path(rect: rect)
        
        XCTAssertEqual(sut.points, [
            Point(x: 53, y: 31),
            Point(x: 66, y: 31),
            Point(x: 66, y: 56),
            Point(x: 53, y: 56)
        ])
    }
}
