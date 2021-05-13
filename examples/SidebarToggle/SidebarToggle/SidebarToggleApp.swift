//
//  SidebarToggleApp.swift
//  SidebarToggle
//
//  Created by Gavin Wiggins on 5/13/21.
//

import SwiftUI

@main
struct SidebarToggleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            SidebarCommands()
        }
    }
}
