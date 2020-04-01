//
//  AppDelegate+Extension.swift
//  Channels
//
//  Created by Omnia Samy on 3/26/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    func setRoot() {
        if #available(iOS 13.0, *) { } else {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            let homeVC = HomeViewController()
            let mainNavigationController = AppNavigationController(rootViewController: homeVC)
            self.window?.rootViewController = mainNavigationController
            self.window?.makeKeyAndVisible()
        }
    }
    
    func initNetwork() {
        NetworkManager.shared = NetworkManager()
    }
}
