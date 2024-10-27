#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(quads, equal_spacing, ccw) in;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare tessellation evaluation shader inputs and outputs
layout(location = 0) in vec4 tese_v0[];
layout(location = 1) in vec4 tese_v1[];
layout(location = 2) in vec4 tese_v2[];
layout(location = 3) in vec4 tese_up[];

layout(location = 0) out vec3 fs_Pos;
layout(location = 1) out vec3 fs_Nor;

void main() {
    float u = gl_TessCoord.x;
    float v = gl_TessCoord.y;

	// TODO: Use u and v to parameterize along the grass blade and output positions for each vertex of the grass blade
    vec3 v0 = tese_v0[0].xyz;
    vec3 v1 = tese_v1[0].xyz;
    vec3 v2 = tese_v2[0].xyz;
    vec3 up = tese_up[0].xyz;

    float orient = tese_v0[0].w;
    float width = tese_v2[0].w;

    // bezier
    vec3 p0 = mix(v0, v1, v);
    vec3 p1 = mix(v1, v2, v);
    vec3 p = mix(p0, p1, u);

    // bitangent
    vec3 t1 = vec3(sin(orient), 0, cos(orient));
    vec3 c0 = p - width * t1;
    vec3 c1 = p + width * t1;
    vec3 t0 = normalize(p1 - p0);

    // Shape
    float tau = 0.1f;
    float t = 0.5 + (u - 0.5) * (1.0f - max(v - tau, 0.0f) / (1.0f - tau));

    fs_Nor = normalize(cross(t0, t1));
    fs_Pos = mix(c0, c1, t);

    gl_Position = camera.proj * camera.view * vec4(fs_Pos, 1.0f);
}
