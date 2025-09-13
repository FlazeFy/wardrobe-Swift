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

struct FetchClothesSummary: Codable {
    let totalClothes: Int
    let maxPrice: Int
    let avgPrice: Int
    let sumClothesQty: Int
    
    enum CodingKeys: String, CodingKey {
        case totalClothes = "total_clothes"
        case maxPrice = "max_price"
        case avgPrice = "avg_price"
        case sumClothesQty = "sum_clothes_qty"
    }
}
