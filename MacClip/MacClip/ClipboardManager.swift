//
//  ClipboardManager.swift
//  MacClip
//
//  Created by Kavya Bhand on 21/04/26.
//

import AppKit

class ClipboardManager {
    
    static let shared = ClipboardManager()
    
    private let pasteboard = NSPasteboard.general
    private var lastChangeCount: Int
    private var timer: Timer?
    
    private var lastCopiedText: String?
    private var lastCopiedImageData: Data?
    
    var history: [ClipboardItem] = []
    let maxItems = 100
    
    private init() {
        lastChangeCount = pasteboard.changeCount
        startMonitoring()
    }
    
    private func startMonitoring() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            self.checkClipboard()
        }
    }
    
    private func checkClipboard() {
        guard pasteboard.changeCount != lastChangeCount else { return }
        lastChangeCount = pasteboard.changeCount
        
        if let str = pasteboard.string(forType: .string) {
            if str == lastCopiedText { return }
            lastCopiedText = str
            addText(str)
            
        } else if let data = pasteboard.data(forType: .tiff),
                  let image = NSImage(data: data) {
            
            if data == lastCopiedImageData { return }
            lastCopiedImageData = data
            addImage(image)
        }
    }
    
    private func addText(_ text: String) {
        guard !text.isEmpty else { return }
        
        let item = ClipboardItem(type: .text, text: text, image: nil, date: Date())
        insert(item)
    }
    
    private func addImage(_ image: NSImage) {
        let item = ClipboardItem(type: .image, text: nil, image: image, date: Date())
        insert(item)
    }
    
    private func insert(_ item: ClipboardItem) {
        history.insert(item, at: 0)
        
        if history.count > maxItems {
            history.removeLast()
        }
        
        NotificationCenter.default.post(name: .clipboardUpdated, object: nil)
    }
    
    func copyToClipboard(_ item: ClipboardItem) {
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        
        switch item.type {
        case .text:
            if let text = item.text {
                lastCopiedText = text
                pasteboard.setString(text, forType: .string)
            }
            
        case .image:
            if let img = item.image,
               let data = img.tiffRepresentation {
                lastCopiedImageData = data
                pasteboard.writeObjects([img])
            }
        }
    }
}

extension Notification.Name {
    static let clipboardUpdated = Notification.Name("clipboardUpdated")
}
