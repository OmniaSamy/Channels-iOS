//
//  NetworkManager+ParseResponse.swift
//  Channels
//
//  Created by Omnia Samy on 3/24/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation
import Moya

// swiftlint:disable all
extension NetworkManager {
    
    func parseResponse<T: Codable>(moyaResult: MoyaCompletion, completion: @escaping(NetworkCompletion<T>)) {
        
        switch moyaResult {
        case .success(let response):
            
            if (200...299 ~= response.statusCode) {
                do {
                    let result = try JSONDecoder().decode(NetworkResponse<T>.self, from: response.data)
                    completion(.success(result.data!), response.statusCode)
                } catch {
                    completion(.failure(NetworkError.parseError), response.statusCode)
                }
            } else {
                // 300-399 ,400-499
                do {
                    var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                    businessError.type = .business
                    completion(.failure(businessError), response.statusCode)
                } catch {
                    completion(.failure(NetworkError.parseError), response.statusCode)
                }
            }
        case .failure(let error):
            let customError = NetworkError(error: error)
            completion(.failure(customError), nil)
        }
    }
}
