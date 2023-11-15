//
//  DrawingInteractorTests.swift
//  DrawingTests
//
//  Created by ByungHoon Ann on 2023/11/16.
//

import XCTest
@testable import Drawing

class DrawingInteractorTests: XCTestCase {
    
    var interactor: MockDrawingInteractor!
    
    override func setUp() {
        interactor = MockDrawingInteractor()
        super.setUp()
    }
    
    override func tearDown() {
        interactor = nil
        super.tearDown()
    }

    func test_서버연결_요청후_ChatClient_ChatServer_객체까지_연동되는가() {
        interactor.serverFetch()

        XCTAssertTrue(interactor.server.runCalled)
        XCTAssertTrue(interactor.chatClientUseCase.serverConnectResult)
    }
    
    func test_동기화_요청시_Presenter까지_연결되는가() {
        interactor.syncDrawingInfo()
        XCTAssertTrue(interactor.chatClientUseCase.chatResult)
        XCTAssertTrue(interactor.presenter.presentDrawingInfoCalled)
    }
    
    func test_로그인_요청시_Presenter까지_연결되는가() {
        interactor.requestLogin(id: "500beckwon")
        XCTAssertTrue(interactor.chatClientUseCase.loginResult)
        XCTAssertTrue(interactor.presenter.sendLoginRequestCalled)
    }
}
