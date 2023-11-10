//
//  DrawingAppTests.swift
//  DrawingAppTests
//
//  Created by 안상희 on 11/9/23.
//

import XCTest

final class DrawingAppTests: XCTestCase {
  
  var sut: RectangleFactory!
  
  override func setUpWithError() throws {
    sut = RectangleFactory()
    
    try super.setUpWithError()
  }
  
  override func tearDownWithError() throws {
    sut = nil
    
    try super.tearDownWithError()
  }
  
  func test_사각형이_생성되었음() {
    // given
    let randomX = Double.random(in: 0...Double(UIScreen.main.bounds.width))
    let randomY = Double.random(in: 0...Double(UIScreen.main.bounds.height) - 100.0)
    
    // when
    let rectangle = sut.create(Boundary(x: randomX, y: randomY))
    
    // then
    XCTAssertNotNil(rectangle)
  }
}
