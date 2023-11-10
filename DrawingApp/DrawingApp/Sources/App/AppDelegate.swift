//
//  AppDelegate.swift
//  DrawingApp
//
//  Created by Dongyoung Kwon on 2023/11/05.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - delegate method for process lifecycle
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        
        return true
    }
    
    // MARK: - delegate method for session lifecycle
    
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return .init(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role
        )
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }
}
