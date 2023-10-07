/* inheretence */
my_INHERITENCE_directionangleable(self)
//my_INHERITENCE_specific_move_sprites(self)

function custom_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = true;
    _instance.my_current_direction = MY_Direction.RIGHT;
    _instance.my_priv_base_speed = 3;
	//_instance.my_priv_speed_modifiers = ds_list_create();
	//_instance.my_priv_speed_modifiers 
}

my_object_moveable_init_function = custom_moveable_init;
//my_object_moveable_init_function(self)

event_inherited();

// INIT
my_GLOBAL_add_player(self)

// Initialize coins value at 0
coins = 0;

//my_load_direction_arrow_gui(self)



//aiming = false;
//aim_angle = direction;
//depth = -9999;