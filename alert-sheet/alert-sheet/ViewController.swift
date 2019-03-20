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
