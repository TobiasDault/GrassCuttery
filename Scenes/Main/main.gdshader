shader_type canvas_item;

uniform vec4 cut_area : source_color = vec4(0.0, 0.0, 0.0, 0.0);

void fragment() {
    vec4 col = texture(TEXTURE, UV);

    if (UV.y > cut_area.y && (UV.x >= cut_area.x && UV.x <= cut_area.z)) {
        col.a = 0.0;
    }

    COLOR = col;
}