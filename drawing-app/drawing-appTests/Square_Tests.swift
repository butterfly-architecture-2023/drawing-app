//
//  drawing_appTests.swift
//  drawing-appTests
//
//  Created by Jihee hwang on 2023/11/06.
//

import XCTest
import RxSwift
import RxCocoa

final class Square_Tests: BaseUnitTests {
    var sut: CanvasViewModel!

    private let canvasSize: CGRect = .init(x: 0, y: 0, width: 1180, height: 700)
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = .init()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    private func createTestSquare() -> Square {
        scheduler
            .createColdObservable([
                .next(0, canvasSize)
            ])
            .bind(to: sut.input.canvasSize)
            .disposed(by: disposeBag)
        
        scheduler
            .createColdObservable([
                .next(0, ())
            ])
            .bind(to: sut.input.didTapMakeSquareButton)
            .disposed(by: disposeBag)
        
        scheduler.start()
        
        let square: Square = sut.makeSquare()!
        return square
    }
    
    func 사각형이_캔버스_범위_안에_존재하는지() {
        let square = createTestSquare()
        
        XCTAssert((0...canvasSize.width).contains(square.rect.width))
        XCTAssert((0...canvasSize.height).contains(square.rect.height))
    }
    
    func 사각형의_크기가_100x100_인지() {
        let square = createTestSquare()
        let defaultSize: CGSize = .init(width: 100, height: 100)
        
        XCTAssertEqual(defaultSize, square.size)
    }
    
    func 사각형이_고유의_ID를_갖는지() {
        let square1 = createTestSquare()
        let square2 = createTestSquare()
        
        XCTAssertNotEqual(square1.id, square2.id)
    }
    
}
