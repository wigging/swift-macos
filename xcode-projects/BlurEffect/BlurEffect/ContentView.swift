//
//  ContentView.swift
//  BlurEffect
//
//  Created by Gavin Wiggins on 4/22/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var blurRadius: CGFloat = 0.0
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Hello 😁")
                .font(.title)
                .blur(radius: blurRadius)
            
            Button("My Button"){}
                .blur(radius: blurRadius)
            
            Slider(value: $blurRadius, in: 0...20, minimumValueLabel: Text("0"), maximumValueLabel: Text("20")) {
                Text("Blur radius")
            }
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
