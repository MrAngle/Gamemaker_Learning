function custom_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = true;
    _instance.my_current_direction = MY_Direction.RIGHT;
    _instance.my_priv_speed = 3;
}

my_object_moveable_init_function = custom_moveable_init;
my_object_moveable_init_function(self)

// Initialize coins value at 0
coins = 0;

my_load_direction_arrow_gui(self)