//
//  ContentView.swift
//  scroll-view
//
//  Created by Gavin Wiggins on 11/13/19.
//  Copyright © 2019 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var toggled = true
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                Text("Example of a scroll view")
                    .font(.headline)
                
                Toggle(isOn: $toggled) {
                    Text("Toggle 1")
                }
                
                Toggle(isOn: $toggled) {
                    Text("Toggle 2")
                }
                
                Toggle(isOn: $toggled) {
                    Text("Toggle 3")
                }
                
                Button(action: {
                    // do something
                }) {
                    Text("Button 1")
                }
                
                Button(action: {
                    // do something
                }) {
                    Text("Button 2")
                }
                
                Button(action: {
                    // do something
                }) {
                    Text("Button 3")
                }
                
                Text("Last Item in scroll view")
            }
            .padding()
            .frame(width: 300)
        }
        .frame(width: 300, height: 200)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
