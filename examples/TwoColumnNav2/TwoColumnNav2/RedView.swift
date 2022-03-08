//
//  RedView.swift
//  TwoColumnNav2
//
//  Created by Gavin Wiggins on 3/7/22.
//

import SwiftUI

struct RedView: View {
    var body: some View {
        VStack {
            Text("Red View").font(.title)
            Text("🍎").font(.title)
        }
        .navigationTitle("Red View")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
    }
}

struct RedView_Previews: PreviewProvider {
    static var previews: some View {
        RedView()
    }
}
