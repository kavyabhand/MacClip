//
//  ClipboardItem.swift
//  MacClip
//
//  Created by Kavya Bhand on 21/04/26.
//

import Foundation
import AppKit

enum ClipboardType {
    case text
    case image
}

struct ClipboardItem: Identifiable {
    let id = UUID()
    let type: ClipboardType
    let text: String?
    let image: NSImage?
    let date: Date
}
