//
//  MetalView.swift
//  MetalSampler
//
//  Created by Gavin Wiggins on 10/7/23.
//

import SwiftUI
import MetalKit

struct MetalView: NSViewRepresentable {

    let mtkView: MTKView

    func makeNSView(context: Context) -> some NSView {
        return mtkView
    }

    func updateNSView(_ nsView: NSViewType, context: Context) { }
}
