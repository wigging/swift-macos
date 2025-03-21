---
title: Grid lines
date: February 4, 2023
---

A GeometryReader can be used to equally space lines in a view even when that view changes size. This is accomplished by using the width and height of the container view to determine the spacing of the lines.

<p><img src="../images/grid-lines.png" style="max-width:400px;" alt="grid lines"></p>

``` { .swift .pre1000 }
import SwiftUI

struct ContentView: View {

    let xSteps = 5  // purple lines for x-axis grid
    let ySteps = 4  // black lines for y-axis grid

    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { geometry in
                Rectangle()
                    .fill(Color.gray)

                // x-axis grid shown as purple lines
                ForEach(0..&lt;self.xSteps+1) {
                    Rectangle()
                        .fill(Color.purple)
                        .frame(width: 3)
                        .offset(x: geometry.size.width / CGFloat(self.xSteps) * CGFloat($0), y: 0.0)
                }

                // y-axis grid shown as black lines
                ForEach(0..&lt;self.ySteps+1) {
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 3)
                        .offset(x: 0.0, y: geometry.size.height / CGFloat(self.ySteps) * CGFloat($0))
                }
            }
        }
        .frame(minWidth: 400, minHeight: 300)
        .padding()
        .background(Color.secondary)
    }
}
```
