//
//  ViewController.swift
//  alert-modal
//
//  Created by Gavin on 3/19/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBAction func exampleA(_ sender: NSButton) {
        let alert = NSAlert()
        alert.addButton(withTitle: "OK")
        alert.alertStyle = .critical
        alert.informativeText = "Some text goes on this line."
        alert.messageText = "The Modal Alert"
        alert.runModal()
    }

    @IBAction func exampleB(_ sender: NSButton) {
        let alert = NSAlert()
        alert.addButton(withTitle: "OK")
        alert.addButton(withTitle: "Cancel")
        alert.alertStyle = .informational
        alert.icon = NSImage(named: "bell")
        alert.informativeText = "Some text goes on this line.\nNext line goes here."
        alert.messageText = "The Modal Alert"
        alert.showsSuppressionButton = true
        
        let textField = NSTextField(frame: NSRect(x: 0, y: 0, width: 200, height: 25))
        alert.accessoryView = textField
        
        let response = alert.runModal()
        if response == .alertFirstButtonReturn {
            print("first button selected: OK")
            print("text is: \(textField.stringValue)")
        } else if response == .alertSecondButtonReturn {
            print("second button selected: Cancel")
            print("text is: \(textField.stringValue)")
        }
    }
    
}
