//
//  SineView.swift
//  SineWave
//
//  Created by Gavin Wiggins on 2/13/22.
//

import SwiftUI

struct MarkersView: View {

    let xValues: [Double]
    let yValues: [Double]

    var body: some View {
        GeometryReader { geom in
            let xMin = xValues.min() ?? 0.0
            let xMax = xValues.max() ?? 1.0

            let yMin = yValues.min() ?? 0.0
            let yMax = yValues.max() ?? 1.0
            
            ForEach(0..<yValues.count, id: \.self) { i in
                Circle()
                    .fill(.blue)
                    .frame(width: 8)
                    .position(
                        x: ((xValues[i] - xMin) * (geom.size.width)) / (xMax - xMin),
                        y: geom.size.height - ((yValues[i] - yMin) * (geom.size.height)) / (yMax - yMin)
                    )
            }
        }
    }
}

struct LineShape: Shape {
    
    let xValues: [Double]
    let yValues: [Double]
    
    func path(in rect: CGRect) -> Path {

        let xMin = xValues.min() ?? 0.0
        let xMax = xValues.max() ?? 1.0

        let yMin = yValues.min() ?? 0.0
        let yMax = yValues.max() ?? 1.0

        // Scale values to CGPoints based on formula at https://en.wikipedia.org/wiki/Normalization_(statistics)
        // X' = a + (X - Xmin)(b - a) / (Xmax - Xmin)
        let pts = zip(xValues, yValues).map { (x: Double, y: Double) -> CGPoint in
            let xn = ((x - xMin) * (rect.width)) / (xMax - xMin)
            let yn = rect.height - ((y - yMin) * (rect.height)) / (yMax - yMin)
            return CGPoint(x: xn, y: yn)
        }

        var path = Path()
        path.move(to: pts[0])

        for i in 1..<pts.count {
            path.addLine(to: pts[i])
        }

        return path
    }
}

struct SineView: View {
    
    @ObservedObject var data: Data
    
    var body: some View {
        ZStack {
            MarkersView(xValues: data.x, yValues: data.y)
            
            LineShape(xValues: data.x, yValues: data.y)
                .stroke(.red, lineWidth: 2.0)
                .border(.white.opacity(0.2))
        }
    }
}

struct SineView_Previews: PreviewProvider {
    
    static let data = Data()
    
    static var previews: some View {
        SineView(data: data)
    }
}
