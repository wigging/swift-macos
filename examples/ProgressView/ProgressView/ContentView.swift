//
//  ContentView.swift
//  ProgressView
//
//  Created by Gavin Wiggins on 3/14/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            ProgressView()
            
            ProgressView("Loading...")
            
            ProgressView(value: 0.3)
            
            ProgressView(value: 40, total: 100)
            
            ProgressView(value: 0.55) {
                Label("Loading", systemImage: "bolt.fill")
            }
            
            ProgressView(value: 0.25, label: {
                Label("Loading", systemImage: "bolt.fill")
            }, currentValueLabel: {
                Text("0.25")
            })
            
            ProgressView(value: 10.0, total: 100.0, label: {
                Label("Download", systemImage: "icloud.and.arrow.down")
            }, currentValueLabel: {
                HStack {
                    Text("0")
                    Spacer()
                    Text("50")
                    Spacer()
                    Text("100")
                }
            })
        }
        .padding()
        .frame(width: 400, height: 500)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
