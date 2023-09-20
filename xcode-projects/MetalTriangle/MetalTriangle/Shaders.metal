//
//  Shaders.metal
//  MetalTriangle
//
//  Created by Gavin Wiggins on 9/10/23.
//

#include <metal_stdlib>
using namespace metal;

vertex float4 vertex_shader(const device packed_float3 *vertices [[buffer(0)]],
                            uint vertexId [[vertex_id]])
{
    return float4(vertices[vertexId], 1);
}

fragment half4 fragment_shader() {
    return half4(1, 0, 0, 1);
}
