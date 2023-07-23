//
//  ViridisImage.swift
//  ImageColormap
//
//  Created by Gavin Wiggins on 7/20/23.
//

import CoreGraphics

/// Create a linear gradient image representing the viridis colormap.
/// - Returns: Image of the viridis colormap.
func makeViridisImage() -> CGImage {

    // RGB values for viridis colormap
    let viridis: [[UInt8]] = [
        [253, 231, 37],
        [181, 222, 43],
        [110, 206, 88],
        [53, 183, 121],
        [31, 158, 137],
        [38, 130, 142],
        [49, 104, 142],
        [62, 73, 137],
        [72, 40, 120],
        [68, 1, 84]
    ]

    let viridisColors: [CGColor] = viridis.map { rgb in
        let r = CGFloat(rgb[0]) / 255.0
        let g = CGFloat(rgb[1]) / 255.0
        let b = CGFloat(rgb[2]) / 255.0
        return CGColor(srgbRed: r, green: g, blue: b, alpha: 1.0)
    }

    let colorSpace = CGColorSpace(name: CGColorSpace.sRGB)!
    let gradient = CGGradient(colorsSpace: colorSpace,
                              colors: viridisColors as CFArray,
                              locations: nil)!

    let width = 256
    let height = 1
    let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue

    let context = CGContext(data: nil,
                            width: width,
                            height: height,
                            bitsPerComponent: 8,
                            bytesPerRow: width * 4,
                            space: colorSpace,
                            bitmapInfo: bitmapInfo)!

    let start = CGPoint(x: 0, y: 0)
    let end = CGPoint(x: width, y: 0)
    context.drawLinearGradient(gradient, start: start, end: end, options: [])

    let image = context.makeImage()!
    
    return image
}
