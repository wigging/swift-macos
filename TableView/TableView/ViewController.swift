//
//  ViewController.swift
//  TableView
//
//  Created by Gavin on 2/24/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    // Don't forget to connect the "dataSource" and "delegate" of the table view
    // to the view controller in Interface Builder.
    
    // Don't forget to set "Identifier" for each table column in Interface Builder.
    
    @IBOutlet weak var tableView: NSTableView!
    
    let makes = ["Ford", "Subaru", "Ford", "Toyota", "Chevy", "Subaru", "Ford"]
    let models = ["Mustang", "Forester", "Bronco", "Tacoma", "Blazer", "Outback", "Ranger"]
    let years = [2018, 2011, 1977, 1994, 1991, 2001, 1998]
}

extension ViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return makes.count
    }
}

extension ViewController: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        guard let column = tableColumn else { return nil }
        
        if let cell = tableView.makeView(withIdentifier: column.identifier, owner: nil) as? NSTableCellView {
            
            if column.identifier.rawValue == "MakeColumn" {
                cell.textField?.stringValue = makes[row]
                return cell
            }
            
            if column.identifier.rawValue == "ModelColumn" {
                cell.textField?.stringValue = models[row]
                return cell
            }
            
            if column.identifier.rawValue == "YearColumn" {
                cell.textField?.stringValue = "\(years[row])"
                return cell
            }
            
        }
        
        return nil
    }
}
