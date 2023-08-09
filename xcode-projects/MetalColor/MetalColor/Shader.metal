//
//  Shader.metal
//  MetalColor
//
//  Created by Gavin Wiggins on 8/8/23.
//

#include <metal_stdlib>
using namespace metal;

kernel void colorScreen (texture2d<half, access::write> output [[texture(0)]],
                         device float4 *color [[buffer(0)]],
                         uint2 id [[thread_position_in_grid]])
{
    output.write(half4(*color), id);
}
