
function custom_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = true;
    _instance.my_current_direction = MY_Direction.RIGHT;
    _instance.my_priv_base_speed = 8;
}

// Create Event w obiekcie-dziecku (przed wywołaniem event_inherited()):

my_object_moveable_init_function = custom_moveable_init;


//my_is_moveable = false;  // nadpisujesz wartość
//my_get_speed(self) = 5;            // nadpisujesz wartość
event_inherited();

//show_debug_message("Jesetm w lighting: " + string(my_current_direction))
//my_get_speed(self) = 8
