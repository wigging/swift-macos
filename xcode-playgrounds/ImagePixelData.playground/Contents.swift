import Accelerate

// Define width and height of image

let width = 200
let height = 200

// Create random RGB data

//var pixelValues = [UInt8](repeating: 0, count: width * height * 3)
//
//for i in 0..<pixelValues.count {
//    pixelValues[i] = .random(in: 0...255)
//}

// Create random RGB data

let n = width * height * 3
var x = [UInt32](repeating: 0, count: n)
arc4random_buf(&x, n * MemoryLayout<UInt32>.size)

let y = vDSP.integerToFloatingPoint(x, floatingPointType: Float.self)
let c = 1 / Float(UInt32.max)
let z = vDSP.multiply(c * 255, y)
let pixelValues = vDSP.floatingPointToInteger(z, integerType: UInt8.self, rounding: .towardNearestInteger)

// Create the image

let buffer = vImage.PixelBuffer(
    pixelValues: pixelValues,
    size: .init(width: width, height: height),
    pixelFormat: vImage.Interleaved8x3.self
)

let format = vImage_CGImageFormat(
    bitsPerComponent: 8,
    bitsPerPixel: 8 * 3,
    colorSpace: CGColorSpaceCreateDeviceRGB(),
    bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
)!

let image = buffer.makeCGImage(cgImageFormat: format)!
