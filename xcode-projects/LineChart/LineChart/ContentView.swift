//
//  ContentView.swift
//  LineChart
//
//  Created by Gavin Wiggins on 11/17/22.
//

import SwiftUI
import Charts

// Basic line chart example using array of structs
// ---------------------------------------------------------------------------

//struct Point: Identifiable {
//    let id = UUID()
//    let x: Float
//    let y: Float
//}
//
//let points = [
//    Point(x: 0, y: 1),
//    Point(x: 1, y: 4.5),
//    Point(x: 2, y: 3),
//    Point(x: 3, y: 6),
//    Point(x: 4, y: 7),
//    Point(x: 5, y: 5.2),
//    Point(x: 6, y: 9),
//    Point(x: 7, y: 12.5),
//    Point(x: 8, y: 5)
//]
//
//struct ContentView: View {
//
//    var body: some View {
//        Chart(points) { point in
//            LineMark(
//                x: .value("X values", point.x),
//                y: .value("Y values", point.y)
//            )
//        }
//        .chartXAxisLabel("The x-axis")
//        .chartYAxisLabel("The y-axis")
//        .padding()
//        .frame(minWidth: 400, minHeight: 300)
//    }
//}

// Line chart example using array of structs and for-each loop
// ---------------------------------------------------------------------------

//struct Point: Identifiable {
//    let id = UUID()
//    let x: Float
//    let y: Float
//}
//
//let points = [
//    Point(x: 0, y: 1),
//    Point(x: 1, y: 4.5),
//    Point(x: 2, y: 3),
//    Point(x: 3, y: 6),
//    Point(x: 4, y: 7),
//    Point(x: 5, y: 5.2),
//    Point(x: 6, y: 9),
//    Point(x: 7, y: 12.5),
//    Point(x: 8, y: 5)
//]
//
//struct ContentView: View {
//
//    var body: some View {
//        Chart {
//            ForEach(points) { point in
//                LineMark(
//                    x: .value("X values", point.x),
//                    y: .value("Y values", point.y)
//                )
//            }
//        }
//        .chartXAxisLabel("The x-axis", alignment: .center)
//        .chartYAxisLabel("The y-axis", position: .leading)
//        //.chartYAxisLabel(position: .leading) { Text("The y-axis").rotationEffect(.degrees(180)) }
//        .chartYAxis {
//            AxisMarks(position: .leading)
//        }
//        .padding()
//        .frame(minWidth: 400, minHeight: 300)
//    }
//}

// Line chart example using array of tuple values and symbol
// ---------------------------------------------------------------------------

//let y = [1, 4.5, 3, 6, 7, 5.2, 9, 12.5, 5]
//
//var data: [(Int, Double)] {
//    let x = Array(0..<y.count)
//    return Array(zip(x, y))
//}
//
//struct ContentView: View {
//
//    var body: some View {
//        Chart(data, id: \.0) {
//            LineMark(
//                x: .value("X values", $0),
//                y: .value("Y values", $1)
//            )
//            .symbol(.circle)
//        }
//        .chartXAxisLabel("The x-axis")
//        .chartYAxisLabel("The y-axis")
//        .padding()
//        .frame(minWidth: 400, minHeight: 300)
//    }
//}

// Line chart example using array of values and symbol
// ---------------------------------------------------------------------------

struct ContentView: View {
    
    let ydata = [1, 4.5, 3, 6, 7, 5.2, 9, 12.5]
    
    var body: some View {
        Chart(0..<ydata.count, id: \.self) { idx in
            LineMark(
                x: .value("X values", idx),
                y: .value("Y values", ydata[idx])
            )
            .symbol(.circle)
        }
        .padding()
        .frame(minWidth: 400, minHeight: 300)
    }
}

// ---------------------------------------------------------------------------

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
