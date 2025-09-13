//
//  R_History.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 13/09/25.
//

import Foundation

class R_History {
    static let shared = R_History()
    private init() {}

    private let baseURL = "http://127.0.0.1:8000/api/v1"

    func getAllHistory(completion: @escaping ([FetchAllHistory]?) -> Void) {
        guard let url = URL(string: "\(baseURL)/history") else {
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
                    let data: InnerData
                    struct InnerData: Codable {
                        let data: [FetchAllHistory]
                    }
                }

                let decoded = try JSONDecoder().decode(ApiResponse.self, from: data)
                completion(decoded.data.data)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}
