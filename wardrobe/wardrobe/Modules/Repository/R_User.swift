//
//  R_User.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 17/09/25.
//

import Foundation

class R_User {
    static let shared = R_User()
    private init() {}
    private let baseURL = "http://127.0.0.1:8000/api/v1"
    private let fetchRestTime: TimeInterval = 360
    
    func getMyProfile(completion: @escaping (FetchMyProfile?) -> Void) {
        let ctx = "myprofile"
        let lastHitKey = "last-hit-myprofile"
        let defaults = UserDefaults.standard
        let now = Date().timeIntervalSince1970
        
        if let lastHit = defaults.double(forKey: lastHitKey) as Double?,
           now - lastHit < fetchRestTime,
           let cachedData = defaults.data(forKey: ctx),
           let stats = try? JSONDecoder().decode(FetchMyProfile.self, from: cachedData) {
            
            completion(stats)
            return
        }
        
        guard let url = URL(string: "\(baseURL)/user/my") else {
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
                    let data: FetchMyProfile
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
