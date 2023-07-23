//
//  ColorImage.swift
//  ImageColormap
//
//  Created by Gavin Wiggins on 7/20/23.
//

import CoreGraphics
import CoreImage

/// Create an image from a colormap filter.
/// - Parameters:
///   - image: Image the colormap is applied to.
///   - gradient: Gradient representing the colormap.
/// - Returns: A colormapped image.
func makeColormapImage(image: CGImage, gradient: CGImage) -> CGImage {

    // Convert to CIImage for filter
    let inputImage = CIImage(cgImage: image)
    let gradientImage = CIImage(cgImage: gradient)

    let filter = CIFilter(name: "CIColorMap")!
    filter.setValue(inputImage, forKey: kCIInputImageKey)
    filter.setValue(gradientImage, forKey: kCIInputGradientImageKey)

    let filteredImage = filter.outputImage!
    let context = CIContext()
    let image = context.createCGImage(filteredImage, from: filteredImage.extent)!

    return image
}
