//
//  SceneDelegate.swift
//  DrawingApp
//
//  Created by 강호성 on 11/4/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = ViewController(
            squareAddingUseCase: SquareManagementUseCaseImpl(),
            squareSelectionUseCase: SquareSelectionUseCaseImpl()
        )
        window?.makeKeyAndVisible()
    }
}

