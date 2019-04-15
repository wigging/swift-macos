//
//  ViewController.swift
//  userdefaults
//
//  Created by Gavin on 4/14/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var ageField: NSTextField!
    @IBOutlet weak var nameField: NSTextField!
    @IBOutlet weak var milesField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayDefaults()
    }
    
    func displayDefaults() {
        let age = UserDefaults.standard.integer(forKey: "age")
        let miles = UserDefaults.standard.float(forKey: "miles")
        ageField.stringValue = "\(age)"
        nameField.stringValue = UserDefaults.standard.string(forKey: "name") ?? ""
        milesField.stringValue = "\(miles)"
    }
    
    @IBAction func setAge(_ sender: NSButton) {
        let age = ageField.stringValue
        if let ageInt = Int(age) {
            UserDefaults.standard.set(ageInt, forKey: "age")
        }
    }
    
    @IBAction func setName(_ sender: NSButton) {
        let name = nameField.stringValue
        UserDefaults.standard.set(name, forKey: "name")
    }
    
    @IBAction func setMiles(_ sender: NSButton) {
        let miles = milesField.stringValue
        if let miles = Float(miles) {
            UserDefaults.standard.set(miles, forKey: "miles")
        }
    }
    
    @IBAction func resetDefaults(_ sender: NSButton) {
        if let bundle = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundle)
        }
        displayDefaults()
    }
    
}
