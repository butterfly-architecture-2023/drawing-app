//
//  NWConnection+Extension.swift
//  Drawing
//
//  Created by ByungHoon Ann on 2023/11/15.
//

import Network
import Foundation

protocol NWConnectionProtocol {
    var stateUpdateHandler: ((_ state: NWConnection.State) -> Void)? { get set }
    func start(queue: DispatchQueue)
    func send(content: Data?, completion: NWConnection.SendCompletion)
    func cancel()
}

extension NWConnection: NWConnectionProtocol {
    func send(content: Data?, completion: NWConnection.SendCompletion) {
        send(content: content,
             contentContext: .defaultMessage,
             isComplete: true,
             completion: completion)
    }
}
