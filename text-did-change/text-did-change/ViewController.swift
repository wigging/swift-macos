//
//  ViewController.swift
//  text-did-change
//
//  Created by Gavin on 3/27/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var label: NSTextField!
    
}

extension ViewController: NSTextFieldDelegate {
    
    /*
     Make sure delegate of the text field is connected to this view controller
     in Interface Builder. The identifier for the text field can be set in
     Interface Builder in the Identity Inspector panel.
     */
    
    func controlTextDidChange(_ obj: Notification) {
        guard let txtField = obj.object as? NSTextField else { return }
        guard let id = textField.identifier?.rawValue else { return }
        print("text field changed - \(txtField.stringValue)")
        print("text field identifier - \(id)")
        label.stringValue = txtField.stringValue
    }
    
}
