//
//  ContentView.swift
//  geometryreader-grid-lines
//
//  Created by Gavin Wiggins on 8/5/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let xSteps = 5  // purple lines for x-axis grid
    let ySteps = 4  // black lines for y-axis grid
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { geometry in
                Rectangle()
                    .fill(Color.gray)
                
                // x-axis grid lines
                ForEach(0..<self.xSteps+1) {
                    Rectangle()
                        .fill(Color.purple)
                        .frame(width: 3)
                        .offset(x: geometry.size.width / CGFloat(self.xSteps) * CGFloat($0), y: 0.0)
                }
                
                // y-axis grid lines
                ForEach(0..<self.ySteps+1) {
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 3)
                        .offset(x: 0.0, y: geometry.size.height / CGFloat(self.ySteps) * CGFloat($0))
                }
            }
        }
        .frame(minWidth: 400, minHeight: 300)
        .padding()
        .background(Color.secondary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
