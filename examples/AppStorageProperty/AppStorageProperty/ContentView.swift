//
//  ContentView.swift
//  AppStorageProperty
//
//  Created by Gavin Wiggins on 2/21/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var thefruit = ""
    @AppStorage("fruit") var fruit = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter fruit", text: $thefruit)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 200)
            Button("Save fruit") {
                fruit = thefruit
            }
            Text("Saved fruit: \(fruit)")
        }
        .frame(width: 400, height: 100)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
