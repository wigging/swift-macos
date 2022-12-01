//
//  TwoColNavSplitApp.swift
//  TwoColNavSplit
//
//  Created by Gavin Wiggins on 11/22/22.
//

import SwiftUI

@main
struct TwoColNavSplitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            SidebarCommands()
        }
    }
}
