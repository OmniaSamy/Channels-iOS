//
//  HomeService.swift
//  Channels
//
//  Created by Omnia Samy on 4/30/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation
import Moya

enum HomeService {
    case categories
    case media
    case channel
}

extension HomeService: TargetType {
    
    var baseURL: URL {
        return Environment.rootURL
    }
    
    var path: String {
        switch self {
        case .categories:
            return "/A0CgArX3"
        //https://pastebin.com/raw/A0CgArX3
        case .media:
            return "/z5AExTtw"
        // https://pastebin.com/raw/z5AExTtw
        case .channel:
            return "/Xt12uVhM"
            //https://pastebin.com/raw/Xt12uVhM
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .categories:
            return .get
        case .media:
            return .get
        case .channel:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        case .categories:
            return .requestPlain
        case .media:
            return .requestPlain
        case .channel:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
