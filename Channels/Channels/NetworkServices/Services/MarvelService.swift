//
//  MarvelService.swift
//  Channels
//
//  Created by Omnia Samy on 3/24/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation
import Moya

enum MarvelService {
    case comics
}

extension MarvelService: TargetType {
    
    var baseURL: URL {
        return Environment.rootURL
    }
    
    var path: String {
        switch self {
        case .comics:
            return "/comics"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .comics:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        let tsDate = "\(Date().timeIntervalSince1970)"
        let hash = (tsDate + Environment.privateKey + Environment.publicKey).md5
        let authParams = ["apikey": Environment.publicKey, "ts": tsDate, "hash": hash]
        
        switch self {
        case .comics:
            
            return .requestParameters(
                parameters: [
                    "format": "comic",
                    "formatType": "comic",
                    "orderBy": "-onsaleDate",
                    "dateDescriptor": "lastWeek",
                    "limit": 50] + authParams,
                encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
