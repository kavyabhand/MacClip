//
//  MenuBarController.swift
//  MacClip
//
//  Created by Kavya Bhand on 21/04/26.
//

import AppKit
import SwiftUI

class MenuBarController: NSObject {
    
    private var statusItem: NSStatusItem!
    private var popover: NSPopover!
    
    override init() {
        super.init()
        setupMenuBar()
        setupPopover()
    }
    
    private func setupMenuBar() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let button = statusItem.button {
            button.title = "📋"
            button.target = self
            button.action = #selector(togglePopover(_:))
        }
    }
    
    private func setupPopover() {
        popover = NSPopover()
        popover.contentSize = NSSize(width: 320, height: 420)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: ContentView())
    }
    
    @objc func togglePopover(_ sender: AnyObject?) {
        guard let button = statusItem.button else { return }
        
        if popover.isShown {
            popover.performClose(sender)
        } else {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
    }
}
