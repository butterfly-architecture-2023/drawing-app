//
//  CanvasTests.swift
//  DrawingAppTests
//
//  Created by 현기엽 on 2023/11/06.
//

import XCTest
@testable import DrawingApp

final class CanvasTests: XCTestCase {
    func test새로운_drawable을_추가할_수_있다() {
        let sut = Canvas()
        let mock = DrawableMock()
        let id = mock.id
        sut.update(mock)
        
        XCTAssertEqual(sut.elements[id]?.id, mock.id)
    }
    
    func test기존에_있는_drawable을_추가하면_새로운_값으로_대체된다() {
        let sut = Canvas()
        let id = UUID()
        let mock1 = DrawableMock(id: id)
        sut.update(mock1)
        let mock2 = DrawableMock(id: id)
        sut.update(mock2)
        
        XCTAssertNotIdentical(sut.elements[id] as? DrawableMock, mock1)
        XCTAssertIdentical(sut.elements[id] as? DrawableMock, mock2)
    }
    
    func test새로운_drawable이_select되면_다른_drawable은_deselect된다() {
        let sut = Canvas()
        let mock1 = DrawableMock(isSelected: true)
        sut.update(mock1)
        let mock2 = DrawableMock()
        sut.update(mock2)
        
        sut.toggle(mock2)
        XCTAssertFalse(mock1.isSelected)
        XCTAssertTrue(mock2.isSelected)
    }
    
    func test이미_selected_되어있는_drawable을_toggle하면_deselected된다() {
        let sut = Canvas()
        let mock1 = DrawableMock(isSelected: true)
        sut.update(mock1)
        let mock2 = DrawableMock()
        sut.update(mock2)
        
        sut.toggle(mock1)
        XCTAssertFalse(mock1.isSelected)
        XCTAssertFalse(mock2.isSelected)
    }
}
