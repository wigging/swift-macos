//
//  ContentView.swift
//  WindowDefaultSize
//
//  Created by Gavin Wiggins on 2/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .padding(.bottom)
            Text("""
            Reset window to default size by deleting
            ~/Library/Containers/com.GavinWiggins.WindowDefaultSize
            """)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
