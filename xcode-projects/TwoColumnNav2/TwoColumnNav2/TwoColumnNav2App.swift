//
//  TwoColumnNav2App.swift
//  TwoColumnNav2
//
//  Created by Gavin Wiggins on 3/7/22.
//

import SwiftUI

@main
struct TwoColumnNav2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            SidebarCommands()
        }
    }
}
