shader_type canvas_item;
uniform sampler2D emmission_texture : filter_linear;
uniform vec4 emmissive_color : source_color = vec4(1.0);


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 current_color = texture(TEXTURE,UV);
	vec4 emmission_color = texture(emmission_texture,UV);
	int x = 2;
	if(emmission_color.r > (0.0))
	{
		COLOR = (emmission_color + current_color);
	}
	else
	{
		COLOR = current_color;
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
