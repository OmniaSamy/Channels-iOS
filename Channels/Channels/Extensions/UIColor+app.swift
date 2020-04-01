//
//  UIColor+app.swift
//  Channels
//
//  Created by Omnia Samy on 3/25/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

extension UIColor {
    
    class var primaryColor: UIColor {
        guard let color = UIColor(named: "Primary Color") else {
            return UIColor()
        }
        return color
    }
    
    class var loaderBackgroundColor: UIColor {
        guard let color = UIColor(named: "Loader Background Color") else {
            return UIColor()
        }
        return color
    }
}
