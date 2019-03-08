//
//  ViewController.swift
//  OutlineView
//
//  Created by Gavin on 3/3/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    let names = ["Homer Simpson", "Bill Murray", "Chevy Chase"]

    @IBOutlet weak var outlineView: NSOutlineView!  // this outline view is a Source List object
    @IBOutlet weak var textLabel: NSTextField!
    
}

extension ViewController: NSOutlineViewDataSource {
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        return names.count
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        return names[index]
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        return false
    }
}

extension ViewController: NSOutlineViewDelegate {
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        
        var tableCellView: NSTableCellView?
        
        if let name = item as? String {
            tableCellView = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataCell"), owner: self) as? NSTableCellView
            
            if let textField = tableCellView?.textField {
                textField.stringValue = name
                textField.sizeToFit()
            }
        }
        
        return tableCellView
    }
    
    func outlineViewSelectionDidChange(_ notification: Notification) {
        
        guard let outlineView = notification.object as? NSOutlineView else { return }
        
        let index = outlineView.selectedRow
        
        if let item = outlineView.item(atRow: index) as? String {
            textLabel.stringValue = "Selected: \(item)"
        }
    }
    
}
