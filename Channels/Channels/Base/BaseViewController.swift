//
//  BaseViewController.swift
//  Channels
//
//  Created by Omnia Samy on 3/26/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import UIKit
import SwiftMessages

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.clearBackBarButtonTitle()
    }
}

/* swiftMessages for handaling error message */
extension BaseViewController {
    
    func showErrorMessage(errorMessage: String) {
        
        let view = MessageView.viewFromNib(layout: .cardView)
        view.button?.isHidden = true
        view.configureTheme(.error)
        view.configureDropShadow()
        var config = SwiftMessages.Config()
        config.presentationContext = .window(windowLevel: .statusBar)
        view.configureContent(title: "error", body: errorMessage)
        view.layoutMarginAdditions = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = 8
        SwiftMessages.show(config: config, view: view)
    }
}

extension BaseViewController: LoaderProtocol {
    
    func showLoader(view: UIView, type: LoaderType) {
        Loader.show(onView: view, type: type)
    }
    
    func hideLoader() {
        Loader.hide()
    }
}
