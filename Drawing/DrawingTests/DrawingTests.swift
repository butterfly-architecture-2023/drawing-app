//
//  DrawingTests.swift
//  DrawingTests
//
//  Created by ByungHoon Ann on 2023/11/05.
//

import XCTest
@testable import Drawing

//func tap(_ button: UIButton) {
//    button.sendActions(for: .touchUpInside)
//}
//
//final class DrawingTests: XCTestCase {
//    var viewController: ViewController!
//    
//    override func setUp() {
//        viewController = ViewController()
//        super.setUp()
//        viewController.loadViewIfNeeded()
//        viewController.canvasView.frame = CGRect(origin: .zero, size: CGSize(width: 1000, height: 1000))
//    }
//    
//    override func tearDown() {
//        super.tearDown()
//        viewController = nil
//    }
//    
//    func test_그리기_터치시_그리기모드가_활성화되는가() {
//        tap(viewController.makeDrawLineButton)
//        XCTAssertTrue(viewController.isDrawingMode)
//    }
//    
//    // 터치 이벤트를 시뮬레이트하여 그리기 모드가 올바르게 비활성화되는지 확인
//    func test_그리기_재터치시_그리기모드가_비활성화되는가() {
//        viewController.makeDrawLineButton.isSelected = true
//        tap(viewController.makeDrawLineButton)
//        XCTAssertFalse(viewController.isDrawingMode)
//    }
//    
//    func test_사각형버튼_터치시_사각형이_제대로_추가되는가() {
//        tap(viewController.makeRectangleButton)
//        XCTAssertEqual(viewController.canvasView.subviews.count, 1)
//        XCTAssertTrue(viewController.canvasView.subviews.first is RectangleButton)
//    }
//    
//    func test_추가한_사각형을_터치했을때_테두리색이_systemRed인가() {
//        tap(viewController.makeRectangleButton)
//        let rectangle = viewController.getRectangleViews()[0]
//        viewController.handleShapeTap(rectangle)
//        XCTAssertEqual(rectangle.layer.borderColor, UIColor.systemRed.cgColor)
//    }
//    
//    func test_추가한_사각형_재터치시_Border색상이_원래대로_돌아가는가() {
//        tap(viewController.makeRectangleButton)
//        tap(viewController.makeRectangleButton)
//        let rectangle1 = viewController.getRectangleViews()[0]
//        let rectangle2 = viewController.getRectangleViews()[1]
//        viewController.handleShapeTap(rectangle1)
//        viewController.handleShapeTap(rectangle2)
//        XCTAssertNotEqual(rectangle1.layer.borderColor, UIColor.systemRed.cgColor)
//    }
//
//    func test_그리기_활성화_할_때_currentDrawingPath가_nil이_아닌가() {
//        tap(viewController.makeDrawLineButton)
//        XCTAssertNotNil(viewController.currentDrawingPath)
//    }
//    
//    func test_그리기_비활성화_할_때_currentDrawingPath가_nil인가() {
//        tap(viewController.makeDrawLineButton)
//        tap(viewController.makeRectangleButton)
//        XCTAssertNil(viewController.currentDrawingPath)
//    }
//    
//    func test_그리기버튼이_비활성화시_터치_좌표가_추가되지않는가() {
//        let touch = UITouch()
//        viewController.touchesBegan([touch], with: nil)
//        viewController.touchesMoved([touch], with: nil)
//        XCTAssertNil(viewController.currentDrawingPath)
//    }
//    
//    // touchesEnded 메서드를 호출하여 그리기 모드에서 그림이 추가되는지 확인
//    func test_그리기를_시도했을_때_그린경로가_Layer에_추가되는가() {
//        tap(viewController.makeDrawLineButton)
//        let touch = UITouch()
//        viewController.touchesMoved([touch], with: nil)
//        viewController.touchesEnded(Set(), with: nil)
//        
//        viewController.touchesMoved([touch], with: nil)
//        viewController.touchesEnded(Set(), with: nil)
//      
//        XCTAssertEqual(viewController.canvasView.layer.sublayers!.count > 1 , true)
//    }
//}
