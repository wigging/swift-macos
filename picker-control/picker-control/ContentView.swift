//
//  ContentView.swift
//  picker-control
//
//  Created by Gavin Wiggins on 11/24/19.
//  Copyright © 2019 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let bands = ["Nirvana", "Pearl Jam", "NIN"]
    @State private var selectedBand = 0
    
    @State private var selectedName = 0
    
    var body: some View {
        VStack(spacing: 20) {
            
            Picker("Band", selection: $selectedBand) {
                ForEach(0..<bands.count) {
                    Text(self.bands[$0])
                }
            }
            
            Picker("Band", selection: $selectedBand) {
                ForEach(0..<bands.count) {
                    Text(self.bands[$0])
                }
            }
            .pickerStyle(RadioGroupPickerStyle())
            
            Picker("Band", selection: $selectedBand) {
                ForEach(0..<bands.count) {
                    Text(self.bands[$0])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Picker("Name", selection: $selectedName) {
                Text("Homer Simpson").tag(0)
                Text("Lisa Simpson").tag(1)
                Text("Bart Simpson").tag(2)
            }
            .fixedSize()
            
            Picker("Name", selection: $selectedName) {
                Text("Homer Simpson").tag(0)
                Text("Lisa Simpson").tag(1)
                Text("Bart Simpson").tag(2)
            }
            .labelsHidden()
            .fixedSize()
            
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
