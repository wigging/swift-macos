//
//  ContentView.swift
//  ViewBuilder
//
//  Created by Gavin Wiggins on 3/8/21.
//

import SwiftUI

struct ViewA: View {
    var body: some View {
        Text("View A")
            .font(.title)
            .frame(width: 200, height: 200)
            .foregroundColor(.black)
            .background(Color.purple)
    }
}

struct ViewB: View {
    var body: some View {
        Text("View B")
            .font(.title)
            .frame(width: 200, height: 200)
            .foregroundColor(.black)
            .background(Color.green)
    }
}

struct ViewC: View {
    var body: some View {
        Text("View C")
            .font(.title)
            .frame(width: 200, height: 200)
            .foregroundColor(.black)
            .background(Color.orange)
    }
}

struct ContentView: View {

    @State private var selectedView = 1

    var body: some View {
        VStack {
            Picker("Select view:", selection: $selectedView) {
                Text("View A").tag(1)
                Text("View B").tag(2)
                Text("View C").tag(3)
            }
            .fixedSize()
            
            getView(tag: selectedView)
        }
        .padding()
        .frame(width: 400, height: 300)
    }
    
    @ViewBuilder
    func getView(tag: Int) -> some View {
        switch tag {
        case 1:
            ViewA()
        case 2:
            ViewB()
        case 3:
            ViewC()
        default:
            ViewA()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
