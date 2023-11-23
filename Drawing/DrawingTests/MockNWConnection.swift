//
//  MockNWConnection.swift
//  DrawingTests
//
//  Created by ByungHoon Ann on 2023/11/16.
//

import UIKit
import Network

@testable import Drawing

class MockNWConnection: NWConnectionProtocol {

    var stateUpdateHandler: ((_ state: NWConnection.State) -> Void)?
    
    private var sendCompletion: NWConnection.SendCompletion?

    func start(queue: DispatchQueue) {
    }

    func send(content: Data?, completion: NWConnection.SendCompletion) {
        sendCompletion = completion
    }

    func cancel() {
        
    }
    
}
