//
//  HomeProtocol.swift
//  Channels
//
//  Created by Omnia Samy on 3/26/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation

protocol homeDelegate: class {
    
    func getComicSucess()
    func getComicFail(errorMessage: String)
}
