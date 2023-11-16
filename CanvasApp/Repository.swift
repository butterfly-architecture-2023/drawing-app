//
//  Repository.swift
//  CanvasApp
//
//  Created by JK on 9/21/23.
//

import Foundation
import Combine

//Repository 모듈/파일
final class Repository : RepositoryPort {
    private var bags = [Cancellable]()
    private var loginUsecase : LoginServiceUsecase
    init(loginUsecase: LoginServiceUsecase) {
        self.loginUsecase = loginUsecase
        self.bags.append(NotificationCenter.default
            .publisher(for: UsecaseNotifications.requestToLogin)
            .sink { _ in self.sendLoginRequest() }
        )
        self.bags.append(NotificationCenter.default
            .publisher(for: UsecaseNotifications.requestToSync)
            .map { $0.userInfo?["data"] as? [Figure] ?? [Figure]() }
            .sink { all in self.sendFigures(all) }
        )
    }

    private func sendLoginRequest() {
        URLSession.shared.dataTask(with: URL(string: "")!) { data, response, error in
            if let data = data {
                self.receivedLogin(id: String(data: data, encoding: .utf8), error: error)
            }
        }.resume()
    }

    private func sendFigures(_ figures: [Figure]) {
        
    }

    func receivedLogin(id: String?, error: Error?) {
        if let error = error {
            self.loginUsecase.errorToLogin(with: error)
        }
        else if let id = id {
            self.loginUsecase.successToLogin(with: id)
        }
    }
}

//Usecase 모듈/파일
protocol SyncServiceUsecase {
    func login()
}

protocol LoginServiceUsecase {
    func successToLogin(with id: String)
    func errorToLogin(with error: Error)
}

enum UsecaseNotifications {
    static let requestToLogin = Notification.Name("request.to.login")
    static let requestToSync = Notification.Name("request.to.sync")
}
