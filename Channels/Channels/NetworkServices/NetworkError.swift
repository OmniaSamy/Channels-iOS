//
//  NetworkError.swift
//  Channels
//
//  Created by Omnia Samy on 3/24/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum `Type`:String, Codable {
    case business
    case system
    case mapping
    case auth
    case network
}

struct NetworkError: Error, Codable {
    
    var code: Int?
    var message: String?
    var type: Type?
    
    init() {}
    
    init(error: MoyaError) {
        
        self.code = error.errorCode
        self.message = error.errorDescription
        
        if case let MoyaError.underlying(underlying, _) = error ,
            case let AFError.sessionTaskFailed(error: urlErrorDomain) = underlying {
            self.message = urlErrorDomain.localizedDescription
        }
    }
}

extension NetworkError {
    
    static let parseError: NetworkError = {
        var error = NetworkError()
        error.type = Type.mapping
        return error
    }()
}
