//
//  SceneDelegate.swift
//  SwiftDrawingApp
//
//  Created by Han Songe on 2023/11/06.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let addRectangleUseCase = AddRectangleUseCase()
        window.rootViewController = BoardViewController.create(with: BoardViewModel(addRectangleUseCase: addRectangleUseCase))
        window.makeKeyAndVisible()
        self.window = window
    }
}
