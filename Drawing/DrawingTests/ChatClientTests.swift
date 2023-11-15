//
//  ChatClientTests.swift
//  DrawingTests
//
//  Created by ByungHoon Ann on 2023/11/15.
//

import Foundation
import XCTest

@testable import Drawing

class ChatClientTests: XCTestCase {
    
    let testCommand = Command(header: Request.Login, id: "500beckwon")
    
    var chatClient: ChatClientUseCase!
    
    override func setUp() {
        chatClient = MockChatClientUseCaseImpl(result: true)
        super.setUp()
    }
    
    override func tearDown() {
        chatClient = nil
        super.tearDown()
    }
    
    func test_서버연결_성공_테스트() {
        let mockConnection = MockNWConnection()
        chatClient.connection = mockConnection
        var result: Bool?
        
        chatClient.connectToServer { success in
            result = success
        }
        
        XCTAssertNotNil(result)
        XCTAssertTrue(result!)
    }
    
    func test_서버로그인_요청_성공_테스트() {
        let mockConnection = MockNWConnection()
        chatClient.connection = mockConnection
        var result: Bool?
        
        chatClient.sendLoginRequest(id: "500beckwon") { success in
            result = success
        }
        
        XCTAssertNotNil(result)
        XCTAssertTrue(result!)
    }
    
    func test_채팅전송_성공_테스트() {
        let mockConnection = MockNWConnection()
        chatClient.connection = mockConnection
        var result: Bool?
        
        chatClient.sendChatRequest(drawingInfos: []) { success in
            result = success
        }
        
        XCTAssertNotNil(result)
        XCTAssertTrue(result!)
    }
}

