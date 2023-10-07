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

function custom_sprites_init(_instance) {
	_instance.my_sprite_MOVEABLE_UP = spr_player_walk_up;
    _instance.my_sprite_MOVEABLE_DOWN = spr_player_walk_down;
    _instance.my_sprite_MOVEABLE_LEFT = spr_player_walk_side;
    _instance.my_sprite_MOVEABLE_RIGHT = spr_player_walk_side;
	_instance.my_sprite_MOVEABLE_IDLE = spr_player_idle
}

my_object_moveable_init_function = custom_moveable_init;
my_object_specific_sprites_init_function = custom_sprites_init;
//my_object_moveable_init_function(self)

event_inherited();

// INIT
my_GLOBAL_add_player(self)
my_set_max_health(self, 1000);
my_load_direction_arrow_gui(self);

// Initialize coins value at 0
coins = 0;

//my_load_direction_arrow_gui(self)



//aiming = false;
//aim_angle = direction;
//depth = -9999;