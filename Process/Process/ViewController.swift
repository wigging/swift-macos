//
//  ViewController.swift
//  Process
//
//  Created by Gavin on 2/21/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var textLabel: NSTextField!
    
    @IBAction func showDateTime(_ sender: NSButton) {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/bin/bash")
        task.arguments = ["-c", "date"]
        
        let outputPipe = Pipe()
        task.standardOutput = outputPipe

        do {
            try task.run()
        } catch {
            print("Error is: \(error.localizedDescription)")
        }
        
        let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(decoding: outputData, as: UTF8.self)
        textLabel.stringValue = output
    }

}
