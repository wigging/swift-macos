//
//  ContentView.swift
//  sidebar-navigation
//
//  Created by Gavin Wiggins on 2/29/20.
//  Copyright © 2020 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedFruit: Fruit?
    
    var body: some View {
        NavigationView {
            NavigationMaster(selectedFruit: $selectedFruit)
            NavigationDetail(fruit: $selectedFruit)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
