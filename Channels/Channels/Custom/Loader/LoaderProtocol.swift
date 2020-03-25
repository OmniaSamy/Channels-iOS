//
//  LoaderProtocol.swift
//  Channels
//
//  Created by Omnia Samy on 3/25/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import  UIKit

protocol LoaderProtocol {
    func showLoader(view: UIView, type: LoaderType)
    func hideLoader()
}

enum LoaderType {
    case custom, native
}
