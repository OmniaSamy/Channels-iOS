//
//  NetworkManager.swift
//  Channels
//
//  Created by Omnia Samy on 3/24/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation
import Moya

class NetworkManager {
    
    static var shared: NetworkManager!
    var marvelProvider: MoyaProvider<MarvelService>!
    
    let headerPlugin = StaticHeaderPlugin(
        headers: [
            "Content-Type": "application/json"
    ])
    
    init() {
        NetworkManager.shared = self
        marvelProvider = MoyaProvider<MarvelService>(session: ChannelsSessionManager.shared,
                                                     plugins: [NetworkLoggerPlugin(), headerPlugin])
    }
}

public struct StaticHeaderPlugin: PluginType {
    
    var headers: [String: String] = [:]
    
    public init(headers: [String: String]) {
        self.headers = headers
    }
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        
        headers.forEach { (key, value) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
}
