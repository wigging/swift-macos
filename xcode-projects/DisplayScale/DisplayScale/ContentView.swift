//
//  ContentView.swift
//  DisplayScale
//
//  Created by Gavin Wiggins on 8/15/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.displayScale) var displayScale
    
    var body: some View {
        VStack(spacing: 10) {
            Text("This screen's display scale is:  \(displayScale, specifier: "%.2f")")
            Text("This view is 300x200 points.")
            Text("This view is \(300*displayScale, specifier: "%.0f")x\(200*displayScale, specifier: "%.0f") pixels.")
        }
        .padding()
        .frame(minWidth: 300, minHeight: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
