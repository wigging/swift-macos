//
//  KiwiView.swift
//  sidebar-v1
//
//  Created by Gavin Wiggins on 2/29/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct KiwiView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                Text("Kiwi View").font(.largeTitle)
                Text("🥝").font(.largeTitle)
                ForEach(1..<20) {
                    Text("Kiwi \($0)")
                }
            }
            .frame(height: 200)
            .padding(.horizontal)
        }
    }
}

struct KiwiView_Previews: PreviewProvider {
    static var previews: some View {
        KiwiView()
    }
}
