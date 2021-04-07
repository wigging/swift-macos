//
//  ContentView.swift
//  ImageSystem
//
//  Created by Gavin Wiggins on 4/6/21.
//

import SwiftUI

struct ContentView: View {
    
    // See the NSImage.Name documentation for available system images
    // https://developer.apple.com/documentation/appkit/nsimage/name
    
    let prefs = NSImage(named: NSImage.preferencesGeneralName)!
    let user = NSImage(named: NSImage.userAccountsName)!
    let advanced = NSImage(named: NSImage.advancedName)!
    let computer = NSImage(named: NSImage.computerName)!
    let folder = NSImage(named: NSImage.folderName)!
    
    let caution = NSImage(named: NSImage.cautionName)!
    let group = NSImage(named: NSImage.userGroupName)!
    let guest = NSImage(named: NSImage.userGuestName)!
    let font = NSImage(named: NSImage.fontPanelName)!
    let info = NSImage(named: NSImage.infoName)!

    var body: some View {
        VStack {
            Text("System images available in macOS")
            HStack(spacing: 60) {
                VStack(spacing: 10) {
                    Image(nsImage: prefs)
                    Image(nsImage: user)
                    Image(nsImage: advanced)
                    Image(nsImage: computer)
                    Image(nsImage: folder)
                }
                VStack(spacing: 10) {
                    Image(nsImage: caution)
                    Image(nsImage: group)
                    Image(nsImage: guest)
                    Image(nsImage: font)
                    Image(nsImage: info)
                }
            }
        }
        .frame(width: 400, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
