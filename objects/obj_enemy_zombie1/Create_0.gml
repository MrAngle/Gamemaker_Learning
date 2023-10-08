function custom_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = true;
    _instance.my_current_direction = MY_Direction.LEFT;
    _instance.my_priv_base_speed = 0.2;
}
my_object_moveable_init_function = custom_moveable_init;

function custom_sprites_init(_instance) {
	_instance.my_sprite_MOVEABLE_UP = spr_baddie_walk_up;
    _instance.my_sprite_MOVEABLE_DOWN = spr_baddie_walk_down;
    _instance.my_sprite_MOVEABLE_LEFT = spr_baddie_walk_side;
    _instance.my_sprite_MOVEABLE_RIGHT = spr_baddie_walk_side;
	_instance.my_sprite_MOVEABLE_IDLE = spr_baddie_idle;
}
my_object_specific_sprites_init_function = custom_sprites_init;
// Create Event w obiekcie-dziecku (przed wywołaniem event_inherited()):



event_inherited();

my_set_max_health(self, 500);