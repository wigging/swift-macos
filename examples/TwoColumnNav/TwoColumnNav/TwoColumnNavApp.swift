//
//  TwoColumnNavApp.swift
//  TwoColumnNav
//
//  Created by Gavin Wiggins on 3/4/22.
//

import SwiftUI

@main
struct TwoColumnNavApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            SidebarCommands()
        }
    }
}
