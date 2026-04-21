//
//  MacClipApp.swift
//  MacClip
//
//  Created by Kavya Bhand on 21/04/26.
//

import SwiftUI

@main
struct MacClipApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}
