function custom_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = true;
    _instance.my_current_direction = MY_Direction.RIGHT;
    _instance.my_priv_base_speed = 2;
}

// Create Event w obiekcie-dziecku (przed wywołaniem event_inherited()):

my_object_moveable_init_function = custom_moveable_init;

event_inherited();

on_collision_function = function(_self) {
	with (_self)
	{instance_destroy();}
}

FIREBALL_ATTACK_1_action(self);

hit_time_interval = 0.3;