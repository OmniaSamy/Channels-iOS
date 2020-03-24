//
//  ChannelsSessionManager.swift
//  Channels
//
//  Created by Omnia Samy on 3/24/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation
import Alamofire

class ChannelsSessionManager {
    
    static let shared = ChannelsSessionManager().manager
    
    var manager: Session
    
    private init() {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 20
        configuration.timeoutIntervalForResource = 20
        manager = Session(configuration: configuration)
    }
}
