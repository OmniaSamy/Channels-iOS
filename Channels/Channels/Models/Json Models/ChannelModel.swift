//
//  ChannelModel.swift
//  Channels
//
//  Created by Omnia Samy on 4/28/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation

struct ChannelModel: Codable {
    
    var coverAsset: CoverAsset?
    var iconAsset: IconAsset?
    var id: String?
    var latestMedia: [LatestMedia]?
    var mediaCount: Int?
    var series: [Sery]?
    var slug: String?
    var title: String?
}

struct Sery: Codable {
    
    var coverAsset: CoverAsset?
    var title: String?
}

struct LatestMedia: Codable {
    
    var coverAsset: CoverAsset?
    var title: String?
    var type: String?
}

struct IconAsset: Codable {
    var thumbnailUrl: String?
}
