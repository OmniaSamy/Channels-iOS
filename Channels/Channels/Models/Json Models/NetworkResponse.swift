//
//  GenericResponse.swift
//  Channels
//
//  Created by Omnia Samy on 4/28/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation

struct NetworkResponse<T: Codable>: Codable {
    
    var data: T?
}
