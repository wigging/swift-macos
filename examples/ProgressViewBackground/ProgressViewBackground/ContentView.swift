//
//  ContentView.swift
//  ProgressViewBackground
//
//  Created by Gavin Wiggins on 3/15/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var x = 0.0
    
    var body: some View {
        VStack {
            ProgressView(
                "Downloading... \(String(format: "%.0f", x))%",
                value: x,
                total: 100.0
            )
            
            // Increase progress bar by 10
            Button("Add 10") {
                if x < 100.0 {
                    x += 10.0
                }
            }
            
            // Increase progress bar by 20 using value from background thread
            Button("Add 20 bg") {
                DispatchQueue.global(qos: .background).async {
                    let z = 10.0
                    DispatchQueue.main.async {
                        if x < 100.0 {
                            x += 10.0 + z
                        }
                    }
                }
            }
        }
        .padding()
        .frame(width: 400, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
