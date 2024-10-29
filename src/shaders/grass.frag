#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare fragment shader inputs
layout(location = 0) in vec3 fs_Pos;
layout(location = 1) in vec3 fs_Nor;
layout(location = 2) in float fs_v;

layout(location = 0) out vec4 outCol;

const vec3 green = vec3(0.404f, 0.620f, 0.231f);
const vec3 lightPos = vec3(0.0f, 50.0f, 15.0f);


void main() {
    // TODO: Compute fragment color

    vec4 diffuse = vec4(green, 1.0f);

    vec3 fs_LightVec = normalize(lightPos - fs_Pos);
//    float lambert = abs(dot(normalize(fs_Nor), fs_LightVec));
    outCol = vec4(green * fs_v * fs_v + 0.2f * green, 1.0f);
}
