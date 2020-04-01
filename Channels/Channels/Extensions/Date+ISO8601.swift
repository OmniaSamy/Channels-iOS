//
//  Date+ISO8601.swift
//  Channels
//
//  Created by Omnia Samy on 3/24/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation

extension Date {
    
    init?(ISO8601: String) {
        let isoFormatter = ISO8601DateFormatter()
        
        guard let date = isoFormatter.date(from: ISO8601) else { return nil }
        self = date
    }
}
