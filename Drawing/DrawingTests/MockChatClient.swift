//
//  MockChatClient.swift
//  DrawingTests
//
//  Created by ByungHoon Ann on 2023/11/16.
//

import Foundation
@testable import Drawing

class MockChatClientUseCaseImpl: ChatClientUseCase {
    var networkInfo: NetworkInfo
    var connection: NWConnectionProtocol?
    var result: Bool
    
    init(result: Bool ,networkInfo: NetworkInfo = NetworkInfo.basePoint) {
        self.result = result
        self.networkInfo = networkInfo
    }
    
    func connectToServer(completion: @escaping(Bool) -> Void) {
        completion(result)
    }
    
    func sendLoginRequest(id: String, completion: @escaping(Bool) -> Void) {
        completion(result)
    }
    
    func sendChatRequest(drawingInfos: [DrawingInfo], completion: @escaping(Bool) -> Void) {
        completion(result)
    }
}
