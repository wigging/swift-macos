//
//  ViewController.swift
//  sidebar
//
//  Created by Gavin on 4/19/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    private let names = ["Homer Simpson", "Chevy Chase", "Dan Aykroyd", "Bill Murray"]
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
        
        let id = NSUserInterfaceItemIdentifier(rawValue: "DataCell")
        
        guard let tableCellView = outlineView.makeView(withIdentifier: id, owner: self) as? NSTableCellView,
            let name = item as? String,
            let textField = tableCellView.textField,
            let imageView = tableCellView.imageView else {
                return nil
        }
        
        textField.stringValue = name
        imageView.image = NSImage(named: NSImage.addTemplateName)
        
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
