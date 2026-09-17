shader_type canvas_item;
uniform int a = 0; // Amplitude
uniform float b = 12.5; // Frequency
uniform float c = 2.0; // Frequency multiplier
uniform bool v_osc = false; // Change between h & v oscillation

void fragment() {
	float a2 = float(a) / 1000.0;
	if (v_osc) {
		float off = a2 * sin((b * UV.y * c));
		COLOR = texture(TEXTURE, vec2(UV.x, UV.y + off));
	} else {
		float off = a2 * sin((b * UV.y));
		COLOR = texture(TEXTURE, vec2(UV.x + off, UV.y));
	}
}