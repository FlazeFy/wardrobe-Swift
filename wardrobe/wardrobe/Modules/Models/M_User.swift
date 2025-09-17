//
//  M_User.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 17/09/25.
//

import Foundation

struct FetchMyProfile: Codable {
    let username: String
    let email: String
    let telegramUserId: String
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case username = "username"
        case email = "email"
        case telegramUserId = "telegram_user_id"
        case createdAt = "created_at"
    }
}
