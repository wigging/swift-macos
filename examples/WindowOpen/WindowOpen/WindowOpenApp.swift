//
//  WindowOpenApp.swift
//  WindowOpen
//
//  Created by Gavin Wiggins on 3/26/22.
//

import SwiftUI

@main
struct WindowOpenApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        WindowGroup("My Info Window") {
            InfoView()
        }
        .handlesExternalEvents(matching: ["infowindow"])
    }
}
