//
//  ContentView.swift
//  SineWave
//
//  Created by Gavin Wiggins on 2/13/22.
//

import SwiftUI

class Data: ObservableObject {
    
    @Published var freq: Double = 4
    @Published var step: Double = 0.05
    
    var x: [Double] {
        Array(stride(from: 0, to: 5, by: step))
    }
    
    var y: [Double] {
        x.map { sin(freq * $0) }
    }
}

struct ContentView: View {
    
    @StateObject private var data = Data()
    
    var body: some View {
        VStack {
            Slider(value: $data.freq, in: 2...10, step: 1.0)
            Text("freq is \(data.freq, specifier: "%.0f")")

            Slider(value: $data.step, in: 0.01...0.1, step: 0.01)
            Text("step is \(data.step, specifier: "%.2f")")
            
            SineView(data: data)
        }
        .padding()
        .frame(minWidth: 500, minHeight: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
