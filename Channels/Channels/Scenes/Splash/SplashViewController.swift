//
//  SplashViewController.swift
//  Channels
//
//  Created by Omnia Samy on 4/2/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet private weak var logoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startAnimation()
    }
    
    func startAnimation() {
        
        UIView.animateKeyframes(withDuration: 3, delay: 0, options: .calculationModeCubic, animations: {
            
            self.logoLabel.alpha = 0.1
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 2, animations: {
                self.logoLabel.transform = CGAffineTransform(scaleX: 3, y: 3)
                self.logoLabel.alpha = 1
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.5, animations: {
                self.logoLabel.transform = .identity
            })
            
            //            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.5, animations: {
            //                self.logoLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            //            })
            
        }, completion: { _ in
            self.setRoot()
        })
    }
    
    func setRoot() {
        
        let homeVC = HomeViewController()
        let mainNavigationController = AppNavigationController(rootViewController: homeVC)
        
        //        let window = UIApplication.shared.windows.first
        let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        window?.rootViewController = mainNavigationController
        window?.makeKeyAndVisible()
    }
}
