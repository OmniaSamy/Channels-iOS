//
//  ListData.swift
//  Channels
//
//  Created by Omnia Samy on 4/28/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation

struct ListData<T: Codable>: Codable {

    var list: [T]?
}

struct CategoryList: Codable {
    
    var categories: [CategoryModel]?
}

struct MediaList: Codable {
    
    var media: [MediaModel]?
}

struct ChannelList: Codable {
    
    var channels: [ChannelModel]?
}
