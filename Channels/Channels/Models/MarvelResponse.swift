//
//  MarvelResponse.swift
//  Channels
//
//  Created by Omnia Samy on 3/24/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation

struct MarvelResponse<T: Codable>: Codable {
    let data: MarvelResults<T>
}

struct MarvelResults<T: Codable>: Codable {
    let results: [T]
}

struct ImgurResponse<T: Codable>: Codable {
    let data: T
}
