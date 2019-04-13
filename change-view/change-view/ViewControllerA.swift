//
//  ViewControllerA.swift
//  change-view
//
//  Created by Gavin on 4/13/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import Cocoa

class ViewControllerA: NSViewController {
    
    @IBOutlet weak var textField: NSTextField!

    @IBAction func showText(_ sender: NSTextField) {
        let x = sender.stringValue
        textField.stringValue = x
    }
    
}
