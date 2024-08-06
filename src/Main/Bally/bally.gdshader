shader_type spatial;
render_mode diffuse_toon, specular_toon;

void fragment() {
  METALLIC = 0.0;
  ROUGHNESS = 0.01;
  ALBEDO = vec3(0.1, 0.3, 0.5);
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
