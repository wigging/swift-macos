//
//  ContentView.swift
//  ToggleAnimation
//
//  Created by Gavin Wiggins on 4/15/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var visible = false
    
    var body: some View {
        VStack {
            Toggle("Visible", isOn: $visible)
            if visible {
                Text("Hello there 👋")
            }
        }
        .animation(.default, value: visible)
        .frame(width: 400, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
