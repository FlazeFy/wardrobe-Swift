//
//  S_User.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 12/09/25.
//

import Foundation

class UserSession {
    static let shared = UserSession()
    private init() {}
    
    private let tokenKey = "auth_token"
    private let roleKey = "auth_role"
    private let emailKey = "auth_email"
    private let usernameKey = "auth_username"
    
    var token: String {
        UserDefaults.standard.string(forKey: tokenKey) ?? ""
    }
    
    var role: String {
        UserDefaults.standard.string(forKey: roleKey) ?? ""
    }
    
    var email: String {
        UserDefaults.standard.string(forKey: emailKey) ?? ""
    }
    
    var username: String {
        UserDefaults.standard.string(forKey: usernameKey) ?? ""
    }
    
    var isLoggedIn: Bool {
        !token.isEmpty
    }
    
    func saveSession(token: String, role: String, email: String, username: String) {
        let defaults = UserDefaults.standard
        defaults.set(token, forKey: tokenKey)
        defaults.set(role, forKey: roleKey)
        defaults.set(email, forKey: emailKey)
        defaults.set(username, forKey: usernameKey)
    }
    
    func clearSession() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: tokenKey)
        defaults.removeObject(forKey: roleKey)
        defaults.removeObject(forKey: emailKey)
        defaults.removeObject(forKey: usernameKey)
    }
}
