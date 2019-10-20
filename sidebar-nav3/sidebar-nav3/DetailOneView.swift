//
//  DetailOneView.swift
//  sidebar-nav3
//
//  Created by Gavin on 8/8/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import SwiftUI

struct DetailOneView: View {
    var body: some View {
        VStack {
            Text("Hello One").font(.largeTitle)
            Button(action: {
                print("button one tapped")
            }) {
                Text("Button One")
            }
        }
        .frame(width: 450, height: 300)
    }
}

#if DEBUG
struct DetailOneView_Previews: PreviewProvider {
    static var previews: some View {
        DetailOneView()
    }
}
#endif
