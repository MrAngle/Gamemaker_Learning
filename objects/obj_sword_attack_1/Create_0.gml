function custom_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = false;
    _instance.my_current_direction = MY_Direction.RIGHT;
    _instance.my_priv_base_speed = 0;
}

// Create Event w obiekcie-dziecku (przed wywołaniem event_inherited()):

my_object_moveable_init_function = custom_moveable_init;

event_inherited();

self.my_damage = floor(random_range(self.my_min_damage, self.my_max_damage + 1));

self.my_skill_effects_function = function(_affected_object) {
	my_apply_damage(_affected_object, self.my_damage);
	my_check_if_dead(_affected_object)

	_affected_object.my_hit_animation_duration_counter = _affected_object.my_hit_animation_duration;
};








alarm[0] = 1;  // Ustawienie alarmu na 1 klatkę