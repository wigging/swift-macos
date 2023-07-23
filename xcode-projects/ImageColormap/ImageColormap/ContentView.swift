//
//  ContentView.swift
//  ImageColormap
//
//  Created by Gavin Wiggins on 7/20/23.
//

import SwiftUI

struct DataImageView: View {
    
    @Binding var data: [Float]
    
    var body: some View {
        HStack(spacing: 40) {
            if data.count > 1 {
                let grayImage = makeGrayImage(from: data, width: 200, height: 200)
                let viridisImage = makeViridisImage()
                let colormapImage = makeColormapImage(image: grayImage, gradient: viridisImage)
                
                Image(grayImage, scale: 1.0, label: Text("gray image"))
                    .frame(width: 200, height: 200)
                Image(colormapImage, scale: 1.0, label: Text("colormap image"))
                    .frame(width: 200, height: 200)
            } else {
                Image(systemName: "photo")
                    .frame(width: 200, height: 200)
                    .border(.gray)
                Image(systemName: "photo")
                    .frame(width: 200, height: 200)
                    .border(.gray)
            }
        }
        .padding(.bottom)
    }
}

struct ContentView: View {

    @State private var selectedData: DataType = .none
    @State private var data: [Float] = [0.0]
    
    var body: some View {
        VStack {
            DataImageView(data: $data)
            
            Picker("Data", selection: $selectedData) {
                Text("Linear Ramp").tag(DataType.linear)
                Text("Random").tag(DataType.random)
                Text("None").tag(DataType.none)
            }
            .pickerStyle(.segmented)
            .frame(width: 400)
            .padding(.bottom)
            
            Button("Create Image") {
                switch selectedData {
                case .linear:
                    data = linearData(width: 200, height: 200)
                case .random:
                    data = randomData(width: 200, height: 200)
                case .none:
                    data = [0.0]
                }
            }
        }
        .padding()
        .frame(minWidth: 600, minHeight: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
