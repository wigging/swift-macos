//
//  ViewController.swift
//  change-view
//
//  Created by Gavin on 4/13/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    let vcA = ViewControllerA(nibName: "ViewA", bundle: nil)
    let vcB = ViewControllerB(nibName: "ViewB", bundle: nil)

    @IBOutlet weak var CustomView: NSView!
    
    @IBAction func showViewA(_ sender: NSButton) {
        CustomView.subviews.removeAll()
        CustomView.addSubview(vcA.view)
    }
    
    @IBAction func showViewB(_ sender: NSButton) {
        CustomView.subviews.removeAll()
        CustomView.addSubview(vcB.view)
    }
    
}
