//
//  PreferencesView.swift
//  preferences-window
//
//  Created by Gavin Wiggins on 11/14/19.
//  Copyright © 2019 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct PreferencesView: View {
    var body: some View {
        Text("My Preferences Window")
            .font(.headline)
            .frame(width: 400, height: 200)
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
