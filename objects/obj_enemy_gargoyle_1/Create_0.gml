function custom_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = true;
    _instance.my_current_direction = MY_Direction.LEFT;
    _instance.my_priv_base_speed = 0.5;
}

function custom_sprites_init(_instance) {
	_instance.my_sprite_MOVEABLE_UP = Sprite7072;
    _instance.my_sprite_MOVEABLE_DOWN = Sprite7072;
    _instance.my_sprite_MOVEABLE_LEFT = Sprite7072;
    _instance.my_sprite_MOVEABLE_RIGHT = Sprite7072;
	_instance.my_sprite_MOVEABLE_IDLE = Sprite7072;
}

my_object_specific_sprites_init_function = custom_sprites_init;
my_object_moveable_init_function = custom_moveable_init;

event_inherited();

my_set_max_health(self, 1000);