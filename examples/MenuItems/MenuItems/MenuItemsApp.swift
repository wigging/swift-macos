//
//  MenuItemsApp.swift
//  MenuItems
//
//  Created by Gavin Wiggins on 7/15/21.
//

import SwiftUI

@main
struct MenuItemsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.commands {
            CommandMenu("My Menu") {
                Text("Some text")
                Button(action: {}, label: {
                    Image(systemName: "clock")
                    Text("Date & Time")
                })
                
                Divider()
                
                Button(action: {}, label: {
                    Text("1️⃣ Item 1")
                })
                Button(action: {}, label: {
                    Text("2️⃣ Item 2")
                })
                
                Divider()
                
                Menu("Sub Menu") {
                    Button(action: {}, label: {
                        Text("Sub Item 1")
                    })
                    Button(action: {}, label: {
                        Text("Sub Item 2")
                    })
                }
            }
        }
    }
}
