//
//  ContentView.swift
//  AsyncForLoop
//
//  Created by Gavin Wiggins on 6/13/23.
//

import SwiftUI

class Simulation: ObservableObject {
    
    @Published var step = 0
    let nsteps = 10
    
    func run() async {
        for n in 0..<nsteps {
            await MainActor.run {
                self.step = n
            }
            print("Running \(n) / \(nsteps)")
            sleep(2)
        }
    }
}

struct ContentView: View {
    
    @StateObject private var simulation = Simulation()
    
    var body: some View {
        VStack {
            Text("Running \(simulation.step + 1) / \(simulation.nsteps)")
            Button("Run simulation") {
                Task {
                    await simulation.run()
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
