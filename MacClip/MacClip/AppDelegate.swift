//
//  AppDelegate.swift
//  MacClip
//
//  Created by Kavya Bhand on 21/04/26.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var menuBarController: MenuBarController?

    func applicationDidFinishLaunching(_ notification: Notification) {
        _ = ClipboardManager.shared
        menuBarController = MenuBarController()
    }
}
