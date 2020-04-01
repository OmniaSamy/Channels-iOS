//
//  PersistenceManager.swift
//  Channels
//
//  Created by Omnia Samy on 3/29/20.
//  Copyright © 2020 Omnia Samy. All rights reserved.
//

import Foundation

enum DefaulKeys: String {
    case dataKey = "Key"
}

class PersistenceManager {
    
    static func clearData(key: DefaulKeys) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    
    static func saveCurrentAppLanguage(key: DefaulKeys, value: String) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func getData() -> String? {
          let savedData = UserDefaults.standard.string(forKey: DefaulKeys.dataKey.rawValue)
          guard let data = savedData else {
              return nil
          }
          return data
      }
}
