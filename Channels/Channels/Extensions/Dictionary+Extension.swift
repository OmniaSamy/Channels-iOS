//
//  Dictionary+Extension.swift
//  Channels
//
//  Created by Omnia Samy on 3/24/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation

public func + <KeyType, ValueType> (left: [KeyType: ValueType], right: [KeyType: ValueType]) -> [KeyType: ValueType] {
    
    var out = left
    
    for (k, v) in right {
        out.updateValue(v, forKey: k)
    }
    
    return out
}
