//
//  ContentView.swift
//  Text
//
//  Created by Gavin Wiggins on 4/4/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Basic text view
            Text("Hello there")
            
            // Text with inline image
            Text("Empty trash \(Image(systemName: "trash"))")
                .padding()
        }
        .frame(width: 400, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
