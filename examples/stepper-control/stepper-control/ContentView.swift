//
//  ContentView.swift
//  stepper-control
//
//  Created by Gavin Wiggins on 11/23/19.
//  Copyright © 2019 Gavin Wiggins. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var age = 18
    @State private var hours = 4.0
    @State private var number = 1
    @State private var setting = UserDefaults.standard.integer(forKey: "Setting")
    
    var body: some View {
        VStack(spacing: 20) {
            
            Stepper("Age: \(age)", value: $age, in: 10...20)
                .frame(width: 120, alignment: .trailing)
            
            Stepper("Hours: \(hours, specifier: "%g")", value: $hours, in: 1...10, step: 0.25)
                .frame(width: 120, alignment: .trailing)
            
            Stepper("Number: \(number)", onIncrement: {
                print("on increment")
                self.number += 1
            }, onDecrement: {
                print("on decrement")
                self.number -= 1
            })
                .frame(width: 120, alignment: .trailing)
            
            Stepper("Another Number: \(number)", onIncrement: {
                print("on increment")
                self.number += 1
            }, onDecrement: {
                print("on decrement")
                self.number -= 1
            }, onEditingChanged: { edited in
                if edited {
                    print("edited")
                } else {
                    print("not edited")
                }
            })
                .frame(width: 180, alignment: .trailing)
            
            Stepper("Setting: \(setting)", value: $setting, in: 0...5, onEditingChanged: { _ in
                UserDefaults.standard.set(self.setting, forKey: "Setting")
            })
                .frame(width: 120, alignment: .trailing)

        }
        .frame(width: 400, height: 220)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
