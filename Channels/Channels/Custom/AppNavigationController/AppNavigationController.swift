//
//  AppNavigationController.swift
//  Channels
//
//  Created by Omnia Samy on 3/26/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

class AppNavigationController: UINavigationController {
    
    let defaultFont = UIFont.systemFont(ofSize: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set navigation bar design
        self.navigationBar.prefersLargeTitles = true
        
        if #available(iOS 13.0, *) {
            let coloredAppearance = UINavigationBarAppearance()
            coloredAppearance.configureWithOpaqueBackground()
            coloredAppearance.backgroundColor = .primaryColor
            coloredAppearance.shadowColor = nil
            coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.titleColor]
            coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.titleColor]
            self.navigationBar.standardAppearance = coloredAppearance
            self.navigationBar.scrollEdgeAppearance = coloredAppearance
        } else {
            // Fallback on earlier versions
            self.navigationBar.barTintColor = UIColor.primaryColor
        }
    }
}

extension UINavigationItem {
    
    func clearBackBarButtonTitle() {
        // Provide an empty backBarButton to hide the 'Back' text present by
        // default in the back button.
        let backBarButton: UIBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.backBarButtonItem = backBarButton
    }
}
