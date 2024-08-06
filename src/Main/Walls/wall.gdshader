shader_type spatial;

uniform vec4 wall_color : source_color = vec4(0.2, 0.2, 0.8, 1.0); // Wall color
uniform float light_intensity : hint_range(0.0, 1.0) = 0.5; // Light intensity

void fragment() {
    // Calculate the normal for lighting
    vec3 normal = normalize(NORMAL);
    
    // Get the light direction (you can adjust this for your scene)
    vec3 light_dir = normalize(vec3(1.0, 1.0, -1.0));
    
    // Calculate the diffuse lighting
    float diff = max(dot(normal, light_dir), 0.0);
    
    // Combine the wall color with the light intensity
    vec4 final_color = wall_color * (diff * light_intensity);
    
    // Set the fragment color
    ALBEDO = final_color.rgb;
}
