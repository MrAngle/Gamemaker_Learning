draw_self();

if (my_hit_animation_duration_counter > 0) {
	image_blend = $FF0000FF & $ffffff;
	image_alpha = ($FF0000FF >> 24) / $ff;
} else {
    image_blend = c_white;
    image_alpha = 1.0;
}

my_draw_health_bar(self);