shader_type canvas_item;
render_mode blend_disabled;

uniform float strength = 0.3;
uniform int channel = 0;

void fragment() {
	// For now just use the distance to our point, the further away, we are, the less we add. 
	// The size of this depends directly on the size of the rectangle we draw
	float add = strength * texture(TEXTURE, UV).r;
	
	// get our current colour at this spot
	vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV).rgba;
	
	if (channel == 0) {
		// decrease all channels
		color.r = clamp(color.r - add, 0.0, 1.0);
		color.g = clamp(color.g - add, 0.0, 1.0);
		color.b = clamp(color.b - add, 0.0, 1.0);
		color.a = clamp(color.a - add, 0.0, 1.0);
	} else {
		if (channel == 1) {
			color.r = clamp(color.r + add, 0.0, 1.0);
			color.g = clamp(color.g - add * 0.3, 0.0, 1.0);
			color.b = clamp(color.b - add * 0.3, 0.0, 1.0);
			color.a = clamp(color.a - add * 0.3, 0.0, 1.0);
		} else if (channel == 2) {
			color.r = clamp(color.r - add * 0.3, 0.0, 1.0);
			color.g = clamp(color.g + add, 0.0, 1.0);
			color.b = clamp(color.b - add * 0.3, 0.0, 1.0);
			color.a = clamp(color.a - add * 0.3, 0.0, 1.0);
		} else if (channel == 3) {
			color.r = clamp(color.r - add * 0.3, 0.0, 1.0);
			color.g = clamp(color.g - add * 0.3, 0.0, 1.0);
			color.b = clamp(color.b + add, 0.0, 1.0);
			color.a = clamp(color.a - add * 0.3, 0.0, 1.0);
		} else if (channel == 4) {
			color.r = clamp(color.r - add * 0.3, 0.0, 1.0);
			color.g = clamp(color.g - add * 0.3, 0.0, 1.0);
			color.b = clamp(color.b - add * 0.3, 0.0, 1.0);
			color.a = clamp(color.a + add, 0.0, 1.0);
		}
		if (length(color) > 1.0) {
			color = normalize(color);
		}
	}
	
	COLOR = color;
}
