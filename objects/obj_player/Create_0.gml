/* inheretence */
my_INHERITENCE_directionangleable(object_index)
//my_INHERITENCE_specific_move_sprites(self)


function custom_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = true;
    _instance.my_current_direction = MY_Direction.RIGHT;
    _instance.my_priv_base_speed = 3;
	//_instance.my_priv_speed_modifiers = ds_list_create();
	//_instance.my_priv_speed_modifiers 
}

function custom_sprites_init(_instance) {
	_instance.my_sprite_MOVEABLE_UP = Spr_Char_03_Back;
    _instance.my_sprite_MOVEABLE_DOWN = Spr_Char_03_Front;
    _instance.my_sprite_MOVEABLE_LEFT = Spr_Char_03_Side;
    _instance.my_sprite_MOVEABLE_RIGHT = Spr_Char_03_Side;
	_instance.my_sprite_MOVEABLE_IDLE = Spr_Char_03_Side;
	//_instance.my_sprite_MOVEABLE_IDLE = spr_player_idle
}

my_object_moveable_init_function = custom_moveable_init;
my_object_specific_sprites_init_function = custom_sprites_init;
//my_object_moveable_init_function(self)

event_inherited();
//view_camera[0] = camera_create();
// INIT
my_GLOBAL_add_player(object_index)
my_set_max_health(object_index, 1000);
my_load_direction_arrow_gui(object_index);

// Initialize coins value at 0
coins = 0;

//my_load_direction_arrow_gui(self)



//aiming = false;
//aim_angle = direction;
//depth = -9999;