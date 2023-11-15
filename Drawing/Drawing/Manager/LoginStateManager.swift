//
//  LoginStateManager.swift
//  Drawing
//
//  Created by ByungHoon Ann on 2023/11/15.
//

final class LoginStateManager {
    static let shared = LoginStateManager()
    
    private var isLoggedIn = false
    private var userId = ""
    
    private init() {}
    
    func loginUser(id: String) {
        isLoggedIn = true
        userId = id
    }
    
    func isUserLogin() -> Bool {
        return isLoggedIn
    }
    
    func getUserId() -> String {
        return userId
    }
}
