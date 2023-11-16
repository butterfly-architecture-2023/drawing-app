//
//  Network.swift
//  CanvasApp
//
//  Created by JK on 9/21/23.
//

import Foundation
import Combine

final class NetworkService {
    private var repositoryPort : RepositoryPort
    private var bags = [Cancellable]()
    init(repositoryPort: RepositoryPort) {
        self.repositoryPort = repositoryPort
        self.bags.append(NotificationCenter.default
            .publisher(for: RepositoryNotifications.sendLogin)
            .sink() {
                _ in self.login( handler: {
                    id, error in
                    repositoryPort.receivedLogin(id: id, error: error)
                })
            }
        )
    }
    func login(handler: (String?, Error?) -> ()) {
        //send login request...
        var id : String?
        var error : Error?
        handler(id, error)
    }
}

//Service 모듈/파일
protocol RepositoryPort {
    func receivedLogin(id: String?, error: Error?)
}

enum RepositoryNotifications {
    static let sendLogin = Notification.Name("send.lgoin")
}
