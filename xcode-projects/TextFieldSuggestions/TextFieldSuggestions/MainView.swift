//
//  ContentView.swift
//  TextSuggestions
//
//  Created by Gavin Wiggins on 6/7/26.
//

import SwiftUI

struct MainView: View {

    @State private var firstInput = ""
    @State private var secondInput = ""

    let items = ["one", "two", "three"]

    var body: some View {
        HStack(alignment: .top , spacing: 20) {
            VStack {
                Text("Example 1").font(.title)

                TextField("Enter some text", text: $firstInput)
                    .textInputSuggestions {
                        Text("One")
                            .textInputCompletion("One 1")
                        Text("Two")
                            .textInputCompletion("Two 2")
                        Text("Three")
                            .textInputCompletion("Three 3")
                    }
            }

            Divider()

            VStack {
                Text("Example 2").font(.title)

                TextField("Enter some text", text: $secondInput)
                    .textInputSuggestions(items, id: \.self) { item in
                        Text(item)
                            .textInputCompletion(item.uppercased())
                    }
            }
        }
        .padding()
    }
}

#Preview {
    MainView()
}
