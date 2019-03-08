//
//  AppDelegate.swift
//  UserDefaults
//
//  Created by Gavin on 2/24/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    override init() {
        
        let defaultDict: [String: Any] = [
            "age": 99,
            "name": "Name",
            "miles": 99
        ]
        
        UserDefaults.standard.register(defaults: defaultDict)
    }
    
}
