//
//  ViewController.swift
//  Alert
//
//  Created by Gavin on 2/13/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBAction func showModalAertA(_ sender: NSButton) {
        let alert = NSAlert()
        alert.addButton(withTitle: "OK")
        alert.alertStyle = .critical
        alert.informativeText = "Some text goes on this line."
        alert.messageText = "The Modal Alert"
        alert.runModal()
    }
    
    @IBAction func showModalAlertB(_ sender: NSButton) {
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
    
    @IBAction func showSheetAlert(_ sender: NSButton) {
        let alert = NSAlert()
        alert.addButton(withTitle: "OK")
        alert.addButton(withTitle: "Cancel")
        alert.messageText = "The Sheet Alert"
        alert.informativeText = "Some informative text goes here."
        alert.alertStyle = .informational
        alert.beginSheetModal(for: self.view.window!) { response in
            if response == .alertFirstButtonReturn {
                print("first button selected: OK")
            } else if response == .alertSecondButtonReturn {
                print("second button selected: Cancel")
            }
        }
    }
    
}

