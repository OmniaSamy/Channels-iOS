//
//  UIView+nib.swift
//  Channels
//
//  Created by Omnia Samy on 4/19/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

extension UIView {
    
    func loadViewFromNib(nibName: String) -> UIView? {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
