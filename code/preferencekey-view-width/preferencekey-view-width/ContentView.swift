//
//  ContentView.swift
//  preferencekey-view-width
//
//  Created by Gavin Wiggins on 7/30/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct ViewWidthKey: PreferenceKey {
    static var defaultValue: CGFloat = 0.0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct ContentView: View {
    
    @State private var boxWidth = CGFloat.zero
    
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .fill(Color.purple)
                    .frame(width: 20)

                Rectangle()
                    .fill(Color.orange)
                    .background(GeometryReader {
                        Color.clear.preference(key: ViewWidthKey.self, value: $0.frame(in: .local).size.width)
                    })
            }

            HStack {
                Spacer()
                Rectangle()
                    .fill(Color.red)
                    .frame(width: boxWidth, height: 20)
            }
        }
        .onPreferenceChange(ViewWidthKey.self) { self.boxWidth = $0 }
        .frame(minWidth: 400, minHeight: 250)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
