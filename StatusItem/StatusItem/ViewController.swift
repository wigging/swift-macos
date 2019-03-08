//
//  ViewController.swift
//  StatusItem
//
//  Created by Gavin on 2/23/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var statusItem = NSStatusItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem.button?.target = self
        statusItem.button?.title = "StatusApp"
        statusItem.button?.action = #selector(itemClicked)
    }
    
    @objc func itemClicked() {
        print("item clicked")
    }

}
