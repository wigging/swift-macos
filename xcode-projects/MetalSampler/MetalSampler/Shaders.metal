//
//  Shaders.metal
//  MetalSampler
//
//  Created by Gavin Wiggins on 10/7/23.
//

#include <metal_stdlib>
using namespace metal;

struct VertexOut {
    float4 position [[position]];
    float2 texCoords;
};

// A vertex function that can be used to draw a single triangle that covers the entire screen

vertex VertexOut fullscreen_vertex(uint vertexID [[vertex_id]]) {
    switch (vertexID) {
        case 0:
            return { .position = { -1.0, 1.0, 0.0, 1.0 }, .texCoords = { 0.0, 0.0 } };
        case 1:
            return { .position = { -1.0, -3.0, 0.0, 1.0 }, .texCoords = { 0.0, 2.0 } };
        case 2: default:
            return { .position = {  3.0, 1.0, 0.0, 1.0 }, .texCoords = { 2.0, 0.0 } };
    }
}

// A linear sampler to upscale the texture
// See section 2.10 Samplers on page 41 in Metal Shading Language PDF for more info

fragment half4 fullscreen_fragment(VertexOut in [[stage_in]],
                                    texture2d<half, access::sample> colorMap [[texture(0)]])
{
    constexpr sampler linear_sampler(coord::normalized, filter::linear, mip_filter::linear, address::repeat);
    half4 color = colorMap.sample(linear_sampler, in.texCoords);
    return color;
}

// Generate noise using the golden ratio
// Based on Shadertoy example https://www.shadertoy.com/view/ltB3zD

float gold_noise(float2 xy, float seed) {
    float phi = 1.61803398874989484820459;
    float z = fract(tan(distance(xy * phi, xy) * seed) * xy.x);
    return z;
}

// Draw the noise to the output texture

kernel void draw_noise(
    uint2 id [[thread_position_in_grid]],
    texture2d<half, access::write> output [[texture(0)]]
){
    float r = gold_noise(float2(id.x, id.y), 0.1);
    float g = gold_noise(float2(id.x, id.y), 0.2);
    float b = gold_noise(float2(id.x, id.y), 0.3);
    half3 c = half3(r, g, b);

    half4 color = half4(c, 1.0);
    output.write(color, id);
}
