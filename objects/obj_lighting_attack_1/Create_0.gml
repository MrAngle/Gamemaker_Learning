
function custom_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = true;
    _instance.my_current_direction = MY_Direction.RIGHT;
    _instance.my_priv_base_speed = 1;
}

// Create Event w obiekcie-dziecku (przed wywołaniem event_inherited()):

my_object_moveable_init_function = custom_moveable_init;

event_inherited();

if(self.my_priv_create_in_description_mode) {
	my_skill_description = "Deals damage ranging from " + string(self.my_min_damage) + " to " + 
			string(self.my_max_damage) + ". Go throught enemies"
}

self.my_skill_name = MY_SKILL_LIST.LIGHTING_1;

my_DEFAULT_simple_damage_action(self);

hit_time_interval = 0.3;

