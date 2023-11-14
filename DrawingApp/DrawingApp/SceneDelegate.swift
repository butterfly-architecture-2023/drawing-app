//
//  SceneDelegate.swift
//  DrawingApp
//
//  Created by 오킹 on 2023/11/08.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = CanvasViewController.create()
        window.makeKeyAndVisible()
        
        self.window = window
    }
}

