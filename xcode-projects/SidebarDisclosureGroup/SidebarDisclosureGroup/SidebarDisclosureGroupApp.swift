//
//  SidebarDisclosureGroupApp.swift
//  SidebarDisclosureGroup
//
//  Created by Szabolcs Tóth on 2021. 09. 10..
//

import SwiftUI

@main
struct SidebarDisclosureGroupApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            SidebarCommands()
        }
    }
}
