//
//  R_Stats.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 13/09/25.
//

import Foundation

class R_Stats {
    static let shared = R_Stats()
    private init() {}
    private let baseURL = "http://127.0.0.1:8000/api/v1"
    private let fetchRestTime: TimeInterval = 360
    
    func getTotalClothesByType(completion: @escaping ([FetchStats]?) -> Void) {
        let ctx = "total-clothes-by-type"
        let lastHitKey = "last-hit-total-clothes-by-type"
        let defaults = UserDefaults.standard
        let now = Date().timeIntervalSince1970
        
        if let lastHit = defaults.double(forKey: lastHitKey) as Double?,
           now - lastHit < fetchRestTime,
           let cachedData = defaults.data(forKey: ctx),
           let stats = try? JSONDecoder().decode([FetchStats].self, from: cachedData) {
            
            completion(stats)
            return
        }
        
        guard let url = URL(string: "\(baseURL)/stats/clothes/by/clothes_type") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer \(UserSession.shared.token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                struct ApiResponse: Codable {
                    let data: [FetchStats]
                }
                
                let decoded = try JSONDecoder().decode(ApiResponse.self, from: data)
                let stats = decoded.data
                
                // Save cache
                if let encoded = try? JSONEncoder().encode(stats) {
                    defaults.set(encoded, forKey: ctx)
                    defaults.set(now, forKey: lastHitKey)
                }
                
                completion(stats)
            } catch {
                completion(nil)
            }
        }.resume()
    }
    
    func getClothesSummary(completion: @escaping (FetchClothesSummary?) -> Void) {
        let ctx = "clothes-summary"
        let lastHitKey = "last-hit-clothes-summary"
        let defaults = UserDefaults.standard
        let now = Date().timeIntervalSince1970
        
        if let lastHit = defaults.double(forKey: lastHitKey) as Double?,
           now - lastHit < fetchRestTime,
           let cachedData = defaults.data(forKey: ctx),
           let stats = try? JSONDecoder().decode(FetchClothesSummary.self, from: cachedData) {
            
            completion(stats)
            return
        }
        
        guard let url = URL(string: "\(baseURL)/stats/clothes/summary") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer \(UserSession.shared.token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                struct ApiResponse: Codable {
                    let data: FetchClothesSummary
                }
                
                let decoded = try JSONDecoder().decode(ApiResponse.self, from: data)
                let stats = decoded.data
                
                // Save cache
                if let encoded = try? JSONEncoder().encode(stats) {
                    defaults.set(encoded, forKey: ctx)
                    defaults.set(now, forKey: lastHitKey)
                }
                
                completion(stats)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}
