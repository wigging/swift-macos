//
//  ContentView.swift
//  WindowStyle
//
//  Created by Gavin Wiggins on 2/6/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Adjust window and toolbar style in the main App struct.")
        }
        .padding()
        .frame(width: 400, height: 300)
        .background(.blue)
        .toolbar {
            ToolbarItemGroup(placement: .automatic, content: {
                Image(systemName: "photo.on.rectangle")
                Text("Image")
            })
            
            ToolbarItemGroup(placement: .automatic, content: {
                Button(action: {}) {
                    Text("Button")
                }
            })
            
            ToolbarItemGroup(placement: .navigation, content: {
                Button(action: {}) {
                    Text("Nav")
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
