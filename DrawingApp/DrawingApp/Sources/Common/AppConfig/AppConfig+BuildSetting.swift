//
//  AppConfig+BuildSetting.swift
//  DrawingApp
//
//  Created by Dongyoung Kwon on 2023/11/05.
//

import Foundation

extension AppConfig.BuildSetting {
    static let appBundleIdentifier: String = {
        guard let bundleIdentifier = Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String else {
            fatalError("missing CFBundleIdentifier")
        }
        
        return bundleIdentifier
    }()
}
