//
//  R_Auth.swift
//  wardrobe
//
//  Created by Leonardho R Sitanggang on 12/09/25.
//

import Foundation

class AuthRepository {
    static let shared = AuthRepository()
    private init() {}
    
    private let baseURL = "http://127.0.0.1:8000/api/v1"
    
    func login(username: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/login") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let params = [
            "username": username,
            "password": password
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NSError(domain: "Invalid response", code: -1)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1)))
                return
            }
            
            if httpResponse.statusCode == 200 {
                // Success Case
                do {
                    let decoded = try JSONDecoder().decode(LoginResponse.self, from: data)
                    
                    UserSession.shared.saveSession(
                        token: decoded.token,
                        role: String(decoded.role),
                        email: decoded.result.email,
                        username: decoded.result.username
                    )
                    
                    completion(.success(decoded))
                } catch {
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print("Failed to decode JSON: \(jsonString)")
                    }
                    completion(.failure(error))
                }
            } else {
                // Failed Case
                do {
                    if httpResponse.statusCode == 400 {
                        // Bad Request
                        // Decode the "result" as a dictionary
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                           let result = json["result"] as? [String: [String]] {
                            
                            // Combine all messages
                            let messages = result.flatMap { $0.value }.joined(separator: "\n")
                            let error = NSError(
                                domain: "ValidationError",
                                code: httpResponse.statusCode,
                                userInfo: [NSLocalizedDescriptionKey: messages]
                            )
                            completion(.failure(error))
                            return
                        }
                    } else {
                        // Other Failed Case
                        let apiError = try JSONDecoder().decode(ErrorResponse.self, from: data)
                        let error = NSError(
                            domain: "APIError",
                            code: httpResponse.statusCode,
                            userInfo: [NSLocalizedDescriptionKey: apiError.result]
                        )
                        completion(.failure(error))
                    }
                } catch {
                    let message = HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode)
                    let fallbackError = NSError(
                        domain: "HTTPError",
                        code: httpResponse.statusCode,
                        userInfo: [NSLocalizedDescriptionKey: message]
                    )
                    completion(.failure(fallbackError))
                }
            }
        }.resume()
    }
}
