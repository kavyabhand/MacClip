//
//  ContentView.swift
//  MacClip
//
//  Created by Kavya Bhand on 21/04/26.
//

import SwiftUI

struct ContentView: View {
    @State private var items: [ClipboardItem] = []
    
    var body: some View {
        List(items) { item in
            HStack {
                if item.type == .text {
                    Text(item.text ?? "")
                        .lineLimit(2)
                        .font(.system(size: 13))
                } else if let img = item.image {
                    Image(nsImage: img)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .cornerRadius(6)
                }
            }
            .padding(6)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            .contentShape(Rectangle())
            .onTapGesture {
                ClipboardManager.shared.copyToClipboard(item)
                NSApp.keyWindow?.close()
            }
        }
        .frame(width: 320, height: 420)
        .onAppear {
            items = ClipboardManager.shared.history
            
            NotificationCenter.default.addObserver(forName: .clipboardUpdated, object: nil, queue: .main) { _ in
                items = ClipboardManager.shared.history
            }
        }
    }
}
