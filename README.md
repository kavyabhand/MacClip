# MacClip

MacClip is a lightweight macOS clipboard manager built using SwiftUI and AppKit.  
It runs in the menu bar and keeps a history of copied text and images.

## Features

- Clipboard history (text and images)
- Menu bar access
- Fast copy reuse
- Duplicate filtering
- Lightweight and minimal

## Preview

(Add a screen recording or GIF here later)

## How It Works

MacClip monitors the system clipboard and stores new entries.  
Clicking an item copies it back to your clipboard for reuse.

## Installation

1. Clone the repository:
   git clone https://github.com/YOUR_USERNAME/macclip.git

2. Open the project in Xcode

3. Build and run the app

## Usage

- Copy anything using Cmd + C
- Click the 📋 icon in the menu bar
- Select an item to copy it again
- Paste using Cmd + V

## Tech Stack

- Swift
- SwiftUI
- AppKit

## Project Structure

- ClipboardManager: Handles clipboard monitoring and storage
- MenuBarController: Controls menu bar UI and popover
- ContentView: Displays clipboard history
- ClipboardItem: Data model

## Future Improvements

- Search functionality
- Persistent storage
- Keyboard shortcuts
- UI improvements
- Auto-launch on login

## Contributing

Pull requests are welcome. For major changes, open an issue first.

## License

MIT License