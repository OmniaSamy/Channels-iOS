//
//  Environment.swift
//  Channels
//
//  Created by Omnia Samy on 3/24/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation

enum Environment {
    
    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let rootURL = "ROOT_URL"
            static let publicKey = "PUBLIC_KEY"
            static let privateKey = "PRIVATE_KEY"
        }
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    // MARK: - Plist values
    static let rootURL: URL = {
        guard let rootURLstring = Environment.infoDictionary[Keys.Plist.rootURL] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        let baseUrl = "https://\(rootURLstring)"
        guard let url = URL(string: baseUrl) else {
            fatalError("Root URL is invalid")
        }
        return url
    }()
    
    static let publicKey: String = {
        guard let apiKey = Environment.infoDictionary[Keys.Plist.publicKey] as? String else {
            fatalError("public Key not set in plist for this environment")
        }
        return apiKey
    }()
    
    static let privateKey: String = {
        guard let apiKey = Environment.infoDictionary[Keys.Plist.privateKey] as? String else {
            fatalError("private Key not set in plist for this environment")
        }
        return apiKey
    }()
}

