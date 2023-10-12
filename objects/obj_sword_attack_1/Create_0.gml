function custom_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = false;
    _instance.my_current_direction = MY_Direction.RIGHT;
    _instance.my_priv_base_speed = 0;
}

// Create Event w obiekcie-dziecku (przed wywołaniem event_inherited()):

my_object_moveable_init_function = custom_moveable_init;

event_inherited();

my_DEFAULT_simple_damage_action(self);

hit_time_interval = 4;
