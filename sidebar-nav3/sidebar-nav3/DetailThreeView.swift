//
//  DetailThreeView.swift
//  sidebar-nav3
//
//  Created by Gavin on 8/8/19.
//  Copyright © 2019 Gavin. All rights reserved.
//

import SwiftUI

struct DetailThreeView: View {
    var body: some View {
        VStack {
            Text("Hello Three").font(.largeTitle)
            Text("Just another view.")
        }
        .frame(width: 450, height: 300)
    }
}

#if DEBUG
struct DetailThreeView_Previews: PreviewProvider {
    static var previews: some View {
        DetailThreeView()
    }
}
#endif
