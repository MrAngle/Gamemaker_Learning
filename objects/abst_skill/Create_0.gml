my_INHERITENCE_movable(self);
my_INHERITENCE_skill(self);
my_INHERITENCE_skill_sequencer(self);
my_INHERITENCE_skill_hit_timer(self);


if(self.my_priv_create_in_description_mode) {
	show_debug_message("[ABST_SKIll] Utworzono w trybie description_mode");

	my_priv_base_speed = 0;
	speed = 0;
}

on_destroy_sprite = sprite_default_on_destroy;
on_collision_function = function(_self) {
}