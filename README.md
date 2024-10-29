# Vulkan Grass Rendering

**University of Pennsylvania, CIS 565: GPU Programming and Architecture, Project 5**

-   Jinxiang Wang
-   Tested on: Windows 11, AMD Ryzen 9 8945HS w/ Radeon 780M Graphics 4.00 GHz 32GB, RTX 4070 Laptop 8 GB

### Features Implemented:

1. Vulkan grass render pipeline
2. Force simulation (gravity, recovery, wind)
3. Culling (orientation, view-frustum, distance)
4. Grass blade tessellation

### Developing progress

| Setup and Bind Resources   | Fixed Orientation       | Add Forces and Culling |
| -------------------------- | ----------------------- | ---------------------- |
| ![](results/showgrass.png) | ![](results/bugfix.png) | ![](results/final.png) |

### Performance Analysis

Scene Spec:

| Resolution | Num Blades       |
| ---------- | ---------------- |
| 1080x1080  | 262144 (1 << 18) |

Results:

|              | No Culling | Orientation Culling | View Frustum Culling | Distance Culling |
| ------------ | ---------- | ------------------- | -------------------- | ---------------- |
| FPS          | 112        | 136                 | 184                  | 189              |
| FPS Increase | 0          | 24                  | 48                   | 5                |
