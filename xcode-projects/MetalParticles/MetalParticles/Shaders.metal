//
//  Shaders.metal
//  MetalParticles
//
//  Created by Gavin Wiggins on 5/20/22.
//

#include <metal_stdlib>
using namespace metal;

struct Particle {
    float4 color;
    float2 position;
    float2 velocity;
};

kernel void clearScreen (
                            texture2d<half, access::write> output [[texture(0)]],
                            uint2 id [[thread_position_in_grid]])
{
    output.write(half4(0), id);
}

kernel void drawParticles (
                           texture2d<half, access::write> output [[texture(0)]],
                           device Particle *particles [[buffer(0)]],
                           uint id [[thread_position_in_grid]])
{
    float width = output.get_width();
    float height = output.get_height();
    
    Particle particle = particles[id];
    float2 position = particle.position;
    float2 velocity = particle.velocity;
    
    if (position.x < 0 || position.x > width) {
        velocity.x *= -1;
    }
    
    if (position.y < 0 || position.y > height) {
        velocity.y *= -1;
    }
    
    position += velocity;
    particle.position = position;
    particle.velocity = velocity;
    particles[id] = particle;
    
    half4 color = half4(particle.color.r, particle.color.g, particle.color.b, 1);
    uint2 pos = uint2(position.x, position.y);

    output.write(color, pos + uint2(-1,  1));
    output.write(color, pos + uint2( 0,  1));
    output.write(color, pos + uint2( 1,  1));
    output.write(color, pos + uint2(-1,  0));
    output.write(color, pos + uint2( 1,  0));
    output.write(color, pos + uint2(-1, -1));
    output.write(color, pos + uint2( 0, -1));
    output.write(color, pos + uint2( 1, -1));
}
