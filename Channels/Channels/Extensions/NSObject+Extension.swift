//
//  NSObject+Extension.swift
//  Channels
//
//  Created by Omnia Samy on 3/25/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation

extension NSObject {
    
    /// return Class Name
    public static var className: String {
        return String(describing: self)
    }
}
