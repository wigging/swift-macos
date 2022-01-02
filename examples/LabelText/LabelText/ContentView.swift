//
//  ContentView.swift
//  LabelText
//
//  Created by Gavin Wiggins on 1/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Small and large label:").padding(8)
            Label("Cloudy", systemImage: "cloud.fill")
            Label("Cloudy", systemImage: "cloud.fill").font(.title)
            
            Text("Show only the title or icon:").padding(8)
            Label("Cloudy", systemImage: "cloud.fill").labelStyle(.titleOnly)
            Label("Cloudy", systemImage: "cloud.fill").labelStyle(.iconOnly)
            
            Text("Custom label:").padding(8)
            Label {
                Text("My Label").font(.headline)
                    .padding(3)
                    .background(.gray.opacity(0.4))
            } icon: {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.purple)
                    .frame(width: 20, height: 20)
            }
        }
        .frame(width: 400, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
