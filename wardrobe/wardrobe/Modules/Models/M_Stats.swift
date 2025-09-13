//
//  M_Stats.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 13/09/25.
//

import Foundation

struct FetchStats: Codable {
    let context: String
    let total: Int
    
    enum CodingKeys: String, CodingKey {
        case context = "context"
        case total = "total"
    }
}
