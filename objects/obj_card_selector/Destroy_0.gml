for(var i= 0; i < array_length(card); i++) {
	with(card[i]) {
		instance_destroy(self);
	}
}
with(global.SINGLETON_DESCRIPTION_CARD) {
	instance_destroy(self);
}
draw_set_font(noone);