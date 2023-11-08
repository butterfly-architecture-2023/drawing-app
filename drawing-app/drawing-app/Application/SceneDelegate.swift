//
//  SceneDelegate.swift
//  drawing-app
//
//  Created by Jiyeon  on 2023/11/04.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let squareFactory: SquareFactory = SquareFactoryImpl()
        let lineFactory: LineFactory = LineFactoryImpl()
        window?.rootViewController = DrawingViewController(viewModel: .init(squareFactory: squareFactory, lineFactory: lineFactory))
        window?.makeKeyAndVisible()
    }
}

