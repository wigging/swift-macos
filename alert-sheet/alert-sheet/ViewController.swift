//
//  ViewController.swift
//  alert-sheet
//
//  Created by Gavin on 3/19/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBAction func exampleA(_ sender: NSButton) {
        let alert = NSAlert()
        alert.messageText = "The Sheet Alert"
        alert.informativeText = "Informative text goes here."
        alert.beginSheetModal(for: self.view.window!, completionHandler: nil)
    }
    
    @IBAction func exampleB(_ sender: NSButton) {
        let alert = NSAlert()
        alert.addButton(withTitle: "OK")
        alert.addButton(withTitle: "Cancel")
        alert.alertStyle = .informational
        alert.icon = NSImage(named: "bell")
        alert.informativeText = "Some informative text goes here."
        alert.messageText = "The Sheet Alert"
        alert.showsSuppressionButton = true
        
        let textField = NSTextField(frame: NSRect(x: 0, y: 0, width: 200, height: 25))
        alert.accessoryView = textField

        alert.beginSheetModal(for: self.view.window!) { response in
            if response == .alertFirstButtonReturn {
                print("first button selected: OK")
            } else if response == .alertSecondButtonReturn {
                print("second button selected: Cancel")
            }
        }
    }

}
