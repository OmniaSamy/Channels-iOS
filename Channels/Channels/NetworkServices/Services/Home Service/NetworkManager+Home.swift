//
//  NetworkManager+Home.swift
//  Channels
//
//  Created by Omnia Samy on 4/30/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation
import Moya

extension NetworkManager {
    
    func getCategories(completion: @escaping(_ result: Swift.Result<CategoryList, NetworkError>,
        _ statusCode: Int?) -> Void) {
        
        homeProvider?.request(.categories) { result in
            
            self.parseResponse(moyaResult: result, completion: completion)
        }
    }
    
    func getMedia(completion: @escaping(_ result: Swift.Result<MediaList, NetworkError>,
        _ statusCode: Int?) -> Void) {
        
        homeProvider?.request(.media) { result in
            
            self.parseResponse(moyaResult: result, completion: completion)
        }
    }
    
    func getChannel(completion: @escaping(_ result: Swift.Result<ChannelList, NetworkError>,
        _ statusCode: Int?) -> Void) {
        
        homeProvider?.request(.channel) { result in
            
            self.parseResponse(moyaResult: result, completion: completion)
        }
    }
}
