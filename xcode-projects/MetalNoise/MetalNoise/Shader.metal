//
//  Shader.metal
//  MetalNoise
//
//  Created by Gavin Wiggins on 9/21/23.
//

#include <metal_stdlib>
using namespace metal;

// Adapted from https://www.shadertoy.com/view/ltB3zD
float gold_noise(float2 xy, float seed) {
    float phi = 1.61803398874989484820459;
    float z = fract(tan(distance(xy * phi, xy) * seed) * xy.x);
    return z;
}

kernel void draw_noise(
    uint2 id [[thread_position_in_grid]],
    texture2d<half, access::write> output [[texture(0)]]
){
    // Gray color
    //float n = gold_noise(float2(id.x, id.y), 0.1);
    //half3 c = half3(n);
    
    // RGB color
    float r = gold_noise(float2(id.x, id.y), 0.1);
    float g = gold_noise(float2(id.x, id.y), 0.2);
    float b = gold_noise(float2(id.x, id.y), 0.3);
    half3 c = half3(r, g, b);

    half4 color = half4(c, 1.0);
    output.write(color, id);
}
