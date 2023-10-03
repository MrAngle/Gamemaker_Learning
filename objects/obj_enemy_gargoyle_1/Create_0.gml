function custom_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = true;
    _instance.my_current_direction = MY_Direction.LEFT;
    _instance.my_priv_speed = 0.5;
}

// Create Event w obiekcie-dziecku (przed wywołaniem event_inherited()):

my_object_moveable_init_function = custom_moveable_init;

event_inherited();

my_current_health = 1000;