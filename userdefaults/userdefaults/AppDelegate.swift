//
//  AppDelegate.swift
//  userdefaults
//
//  Created by Gavin on 4/14/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    override init() {
        
        let defaultDict: [String: Any] = [
            "age": 99,
            "name": "Bart",
            "miles": 99
        ]
        
        UserDefaults.standard.register(defaults: defaultDict)
    }

}
