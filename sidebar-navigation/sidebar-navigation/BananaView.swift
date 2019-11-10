//
//  BananaView.swift
//  sidebar-navigation
//
//  Created by Gavin Wiggins on 11/10/19.
//  Copyright © 2019 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct BananaView: View {
    var body: some View {
        VStack {
            Text("The Banana")
            Text("🍌").font(.title)
            Button(action: {
                print("Clicked banana button")
            }) {
                Text("Click me")
            }
        }
        .frame(width: 480, height: 300)
    }
}

struct BananaView_Previews: PreviewProvider {
    static var previews: some View {
        BananaView()
    }
}
