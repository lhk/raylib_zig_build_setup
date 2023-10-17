
// src/main.zig
const r = @cImport(@cInclude("raylib.h"));

// create struct for position
pub const Position = struct {
    x: f32,
    y: f32,
};

pub fn main() !void {
	r.InitWindow(960, 540, "My Window Name");
	r.SetTargetFPS(144);
	defer r.CloseWindow();

    var pos = Position { .x = 0.0, .y = 0.0 };

	while (!r.WindowShouldClose()) {
		r.BeginDrawing();
		r.ClearBackground(r.BLACK);
        r.DrawText("Congrats! You created your first window!", 190, 200, 20, r.LIGHTGRAY);

        if(r.IsKeyDown(r.KEY_RIGHT)) {
            pos.x += 1.0;
        }
        if(r.IsKeyDown(r.KEY_LEFT)) {
            pos.x -= 1.0;
        }
        if(r.IsKeyDown(r.KEY_UP)) {
            pos.y -= 1.0;
        }
        if(r.IsKeyDown(r.KEY_DOWN)) {
            pos.y += 1.0;
        }

        r.DrawCircleV(r.Vector2 { .x = pos.x, .y = pos.y }, 50.0, r.RED);

		r.EndDrawing();
	}
}