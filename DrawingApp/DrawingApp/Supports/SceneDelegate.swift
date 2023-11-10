//
//  SceneDelegate.swift
//  DrawingApp
//
//  Created by 백상휘 on 2023/11/04.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: windowScene)
    if let sceneWidth = window?.frame.size.width, sceneWidth > 450 {
      window?.rootViewController = iPadMainViewController()
    } else {
      window?.rootViewController = iOSMainViewController()
    }
    window?.makeKeyAndVisible()
  }
}

