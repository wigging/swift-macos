//
//  ContentView.swift
//  image-icons
//
//  Created by Gavin on 9/30/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let prefs = NSImage(named: NSImage.preferencesGeneralName)!
    let user = NSImage(named: NSImage.userAccountsName)!
    let advanced = NSImage(named: NSImage.advancedName)!
    let computer = NSImage(named: NSImage.computerName)!
    let folder = NSImage(named: NSImage.folderName)!
    
    
    
    // See the NSImage.Name docs for available system images
    // https://developer.apple.com/documentation/appkit/nsimage/name
    
    var body: some View {
        VStack {
            Text("System images available in macOS")
            HStack(spacing: 40) {
                VStack(spacing: 10) {
                    Image(nsImage: prefs)
                    Image(nsImage: user)
                    Image(nsImage: advanced)
                    Image(nsImage: computer)
                    Image(nsImage: folder)
                }
                VStack(spacing: 10) {
                    Image(nsImage: prefs)
                    Image(nsImage: user)
                    Image(nsImage: advanced)
                    Image(nsImage: computer)
                    Image(nsImage: folder)
                }
            }
        }
        .frame(width: 480, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
