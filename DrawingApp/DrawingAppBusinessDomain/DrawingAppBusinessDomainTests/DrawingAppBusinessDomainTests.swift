//
//  DrawingAppBusinessDomainTests.swift
//  DrawingAppBusinessDomainTests
//
//  Created by 백상휘 on 2023/11/04.
//

import XCTest

final class DrawingAppBusinessDomainTests: XCTestCase {
    func testExample() throws {
      let manager = DrawingResourceManager()
      
      for _ in 0..<3 {
        let _ = manager.addSquare()
        let _ = manager.addVector()
      }
      
      XCTAssertEqual(manager.squares.count, manager.vectors.count)
    }
}
