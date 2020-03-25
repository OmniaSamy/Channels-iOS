
//
//  Loader.swift
//  Channels
//
//  Created by Omnia Samy on 3/25/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

class Loader: NSObject {
    
    static var sharedViewSpinner: UIView?
    static let image = UIImage()
    
    class func show (onView: UIView, type: LoaderType) {
        
        if sharedViewSpinner != nil {
            sharedViewSpinner?.removeFromSuperview()
        }
        
        let spinnerView = UIView(frame: UIScreen.main.bounds)
        spinnerView.backgroundColor = .loaderBackgroundColor
        let viewBackgroundLoading: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        
        switch type {
        case .custom:
            let activityIndicator = UIImageView(image: image)
            activityIndicator.center = viewBackgroundLoading.center
            viewBackgroundLoading.addSubview(activityIndicator)
            
        case .native:
            let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
            activityIndicator.color = UIColor.primaryColor
            activityIndicator.startAnimating()
            activityIndicator.center = viewBackgroundLoading.center
            viewBackgroundLoading.addSubview(activityIndicator)
        }
        
        viewBackgroundLoading.center = spinnerView.center
        viewBackgroundLoading.backgroundColor = UIColor.white
        viewBackgroundLoading.alpha = 0.5
        viewBackgroundLoading.clipsToBounds = true
        viewBackgroundLoading.layer.cornerRadius = 15
        
        spinnerView.addSubview(viewBackgroundLoading)
        onView.addSubview(spinnerView)
        
        sharedViewSpinner = spinnerView
    }
    
    class func hide() {
        sharedViewSpinner?.removeFromSuperview()
        sharedViewSpinner = nil
    }
}
