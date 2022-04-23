//
//  adder.metal
//  ArrayAddition
//
//  Created by Gavin Wiggins on 4/18/22.
//

#include <metal_stdlib>
using namespace metal;

kernel void adder(
                  constant float *array1 [[ buffer(0) ]],
                  constant float *array2 [[ buffer(1) ]],
                  device float *result [[ buffer(2) ]],
                  uint index [[ thread_position_in_grid ]])
{
    result[index] = array1[index] + array2[index];
}
