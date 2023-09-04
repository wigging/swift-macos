//
//  MetalView.swift
//  MetalColor
//
//  Created by Gavin Wiggins on 8/8/23.
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
