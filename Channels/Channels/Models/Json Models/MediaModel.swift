//
//  MediaModel.swift
//  Channels
//
//  Created by Omnia Samy on 4/28/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation

struct MediaModel: Codable {
    
    var type: String?
    var title: String?
    var coverAsset: CoverAsset?
    var channel: Channel?
}

struct CoverAsset: Codable {
    var url: String?
}

struct Channel: Codable {
    var title: String?
}
