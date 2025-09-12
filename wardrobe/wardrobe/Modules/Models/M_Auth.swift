//
//  M_Auth.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 12/09/25.
//


import Foundation

struct LoginResponse: Codable {
    let status: String
    let token: String
    let role: Int
    let result: UserResult
}

struct UserResult: Codable {
    let id: String
    let username: String
    let email: String
    let telegram_user_id: String?
    let telegram_is_valid: Int
    let created_at: String
    let updated_at: String?
}
