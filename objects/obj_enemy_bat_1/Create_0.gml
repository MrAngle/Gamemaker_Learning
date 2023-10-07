function custom_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = true;
    _instance.my_current_direction = MY_Direction.LEFT;
    _instance.my_priv_base_speed = 1;
}
my_object_moveable_init_function = custom_moveable_init;

function custom_sprites_init(_instance) {
	_instance.my_sprite_MOVEABLE_UP = spr_bat_fly;
    _instance.my_sprite_MOVEABLE_DOWN = spr_bat_fly;
    _instance.my_sprite_MOVEABLE_LEFT = spr_bat_fly;
    _instance.my_sprite_MOVEABLE_RIGHT = spr_bat_fly;
	_instance.my_sprite_MOVEABLE_IDLE = spr_bat_fly;
}
my_object_specific_sprites_init_function = custom_sprites_init;
// Create Event w obiekcie-dziecku (przed wywołaniem event_inherited()):



event_inherited();
