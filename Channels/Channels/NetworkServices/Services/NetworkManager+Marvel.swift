//
//  NetworkManager+Marvel.swift
//  Channels
//
//  Created by Omnia Samy on 3/24/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation
import Moya

extension NetworkManager {
    
    func getComics(completion: @escaping(_ result: Swift.Result<MarvelResults<Comic>, NetworkError>,
        _ statusCode: Int?) -> Void) {
        
        marvelProvider?.request(.comics) { result in
            
            self.parseResponse(moyaResult: result, completion: completion)
        }
    }
}
