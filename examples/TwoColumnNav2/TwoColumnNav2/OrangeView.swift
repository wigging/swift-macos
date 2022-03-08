//
//  OrangeView.swift
//  TwoColumnNav2
//
//  Created by Gavin Wiggins on 3/7/22.
//

import SwiftUI

struct OrangeView: View {
    var body: some View {
        VStack {
            Text("Orange View").font(.title)
            Text("🍊").font(.title)
        }
        .navigationTitle("Orange View")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.orange)
    }
}

struct OrangeView_Previews: PreviewProvider {
    static var previews: some View {
        OrangeView()
    }
}
