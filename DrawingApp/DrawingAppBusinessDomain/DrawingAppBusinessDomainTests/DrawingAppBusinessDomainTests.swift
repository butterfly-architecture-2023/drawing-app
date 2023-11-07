//
//  DrawingAppBusinessDomainTests.swift
//  DrawingAppBusinessDomainTests
//
//  Created by 백상휘 on 2023/11/04.
//

import XCTest

final class DrawingAppBusinessDomainTests: XCTestCase {
  var manager: DrawingResourceManager = DrawingResourceManager(.init(width: 500, height: 500))
  
  override func setUp() {
    manager = DrawingResourceManager(.init(width: 500, height: 500))
  }
  
  func test_매니저_엔티티_생성_테스트() throws {
    for _ in 0..<3 {
      let _ = manager.addSquare()
      let _ = manager.addVector(from: .init(x: 0, y: 0))
    }
    
    XCTAssertEqual(manager.squares.count, manager.vectors.count)
  }
  
  func test_매니저_사각형_엔티티_랜덤_위치_테스트() throws {
    var position: GesturePosition?
    for _ in 0..<3 {
      let square = manager.addSquare()
      
      XCTAssertNotEqual(position, square.position)
      position = square.position
    }
  }
  
  func test_사각형_엔티티_move() throws {
    let square = manager.addSquare()
    let mocks: [GesturePosition] = [
      GesturePosition(x: 0, y: 0),
      GesturePosition(x: 100, y: 100),
      GesturePosition(x: 200, y: 200),
      GesturePosition(x: 300, y: 300),
      GesturePosition(x: 400, y: 400),
    ]
    
    for mock in mocks {
      let result = manager.moveSquare(square, at: mock)
      XCTAssertTrue(result)
      XCTAssertEqual(square.position, mock)
    }
  }
  
  func test_매니저_사각형_엔티티_랜덤_색상_테스트() throws {
    for _ in 0..<50 {
      let _ = manager.addSquare()
    }
    
    XCTAssertEqual(manager.squares.count, Set(manager.squares).count)
  }
  
  func test_매니저_사각형_엔티티_위치_지정_테스트() throws {
    let square = manager.addSquare()
    
    for _ in 0..<20 {
      let position = square.position
      square.random(manager.canvasSize)
      XCTAssertNotEqual(position, square.position)
    }
  }
}

extension Square: Hashable {
  public static func == (lhs: Square, rhs: Square) -> Bool {
    lhs.hexColor == rhs.hexColor
  }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(colorSet.red)
    hasher.combine(colorSet.green)
    hasher.combine(colorSet.blue)
  }
}
