//
//  ViewController.swift
//  MacClip
//
//  Created by Kavya Bhand on 21/04/26.
//

import AppKit

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    
    private var tableView: NSTableView!
    
    override func loadView() {
        view = NSView(frame: NSRect(x: 0, y: 0, width: 300, height: 400))
        
        let scrollView = NSScrollView(frame: view.bounds)
        tableView = NSTableView(frame: view.bounds)
        
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier("col"))
        column.width = 300
        tableView.addTableColumn(column)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        scrollView.documentView = tableView
        view.addSubview(scrollView)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reloadData),
                                               name: .clipboardUpdated,
                                               object: nil)
    }
    
    @objc private func reloadData() {
        tableView.reloadData()
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return ClipboardManager.shared.history.count
    }
    
    func tableView(_ tableView: NSTableView,
                   viewFor tableColumn: NSTableColumn?,
                   row: Int) -> NSView? {
        
        let item = ClipboardManager.shared.history[row]
        
        let cell = NSTextField(labelWithString: "")
        
        if item.type == .text {
            cell.stringValue = item.text ?? ""
        } else {
            cell.stringValue = "🖼 Image"
        }
        
        return cell
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let row = tableView.selectedRow
        guard row >= 0 else { return }
        
        let item = ClipboardManager.shared.history[row]
        ClipboardManager.shared.copyToClipboard(item)
    }
}
