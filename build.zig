// build.zig
const std = @import("std");
const raySdk = @import("raylib/src/build.zig");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});

    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "zig-raylib",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });

    b.installArtifact(exe);

    var raylib = raySdk.addRaylib(b, target, optimize, .{
        // Add in optional modules in raylib. These match up to the options struct.
        // https://github.com/raysan5/raylib/blob/bc15c19518968878b68bbfe8eac3fe4297f11770/src/build.zig#L161
        .raudio = true,
        .rmodels = true,
        .rshapes = true,
        .rtext = true,
        .rtextures = true,
        .raygui = true,
        .platform_drm = false,
    });
    exe.addIncludePath(.{ .path = "raylib/src" });
    exe.addIncludePath(.{ .path = "raygui/src" });
    exe.linkLibrary(raylib);

    const run_cmd = b.addRunArtifact(exe);

    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
