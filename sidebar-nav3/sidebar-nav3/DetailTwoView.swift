//
//  DetailTwoView.swift
//  sidebar-nav3
//
//  Created by Gavin on 8/8/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import SwiftUI

struct DetailTwoView: View {
    @State private var isOn = false
    
    var body: some View {
        VStack {
            Text("Hello Two").font(.largeTitle)
            Toggle(isOn: $isOn) {
                Text("Toggle Two")
            }
        }
        .frame(width: 450, height: 300)
    }
}

#if DEBUG
struct DetailTwoView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTwoView()
    }
}
#endif
