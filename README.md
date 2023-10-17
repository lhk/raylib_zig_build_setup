This repository contains a minimal example how to set up build.zig for raylib and raygui.

It's based on ___zig 0.11.0___, which is compatible with the build.zig currently at https://github.com/raysan5/raylib/blob/f353cd1c3a884d6b80af311d40586ad414e09efd/src/build.zig

I'm using submodules to include raylib and raygui.
All the heavy lifting is done by the build.zig shipped with raylib itself.

If you'd like to use the zig package manager, please take a look at https://ziggit.dev/t/can-you-locate-and-copy-dependency-files-specified-in-zon-files/1934
Many thanks to pavocracy and IntegratedQuantum, who created a much more sophisticated setup here: https://gitlab.pavocracy.dev/personal-projects/raylib-and-raygui-in-zig
As far as I understand, the current zig 0.12-dev is only compatible with the raylib build.zig if it's pinned to a specific revision, and not the latest master.
Be aware of the zig version recorded in pavocracy's README.
