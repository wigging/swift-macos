//
//  WindowView.swift
//  window-open
//
//  Created by Gavin Wiggins on 4/3/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct WindowView: View {
    var body: some View {
        Text("Hello 🤪")
            .font(.title)
            .frame(width: 300, height: 300)
    }
}

struct WindowView_Previews: PreviewProvider {
    static var previews: some View {
        WindowView()
    }
}
