//
//  MangoView.swift
//  sidebar-v1
//
//  Created by Gavin Wiggins on 2/29/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct MangoView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Text("Mango View").font(.largeTitle)
                Text("🥭").font(.largeTitle)
                ForEach(1..<20) {
                    Text("Mango \($0)")
                }
            }
            .frame(width: 300)
            .padding(.vertical)
        }
    }
}

struct MangoView_Previews: PreviewProvider {
    static var previews: some View {
        MangoView()
    }
}
