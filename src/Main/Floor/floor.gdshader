shader_type spatial;

uniform vec4 grid_color : source_color;
uniform vec4 background_color : source_color;
uniform float line_thickness : hint_range(0.0, 1.0) = 0.05;
uniform float cell_size : hint_range(0.1, 10.0) = 1.0;

void fragment() {
    // Get the UV coordinates from the mesh
    vec2 uv = UV * cell_size;

    // Calculate the distance to the nearest grid line
    float dist_to_line_u = min(mod(uv.x, 1.0), 1.0 - mod(uv.x, 1.0));
    float dist_to_line_v = min(mod(uv.y, 1.0), 1.0 - mod(uv.y, 1.0));

    // Determine if we are in the grid line or in the cell background
    float line_width = line_thickness * 0.5;
    if (dist_to_line_u < line_width || dist_to_line_v < line_width) {
        ALBEDO = grid_color.rgb;
        ALPHA = grid_color.a;
    } else {
        ALBEDO = background_color.rgb;
        ALPHA = background_color.a;
    }
}
