function custom_sprites_init(_instance) {
	_instance.my_sprite_MOVEABLE_UP = Sprite7072;
    _instance.my_sprite_MOVEABLE_DOWN = Sprite7072;
    _instance.my_sprite_MOVEABLE_LEFT = Sprite7072;
    _instance.my_sprite_MOVEABLE_RIGHT = Sprite7072;
	_instance.my_sprite_MOVEABLE_IDLE = Sprite7072
}
my_object_specific_sprites_init_function = custom_sprites_init;

event_inherited();

// The movement speed of the
// enemy along its path.
move_speed = 2;

// This will be true when the baddie
// is attacking the player, otherwise
// it will be false.
attacking = false;

// Starts following the path
// stored in the path_to_follow
// variable. This is created in
// the "Variable Definitions" 
// menu.
// path_action_continue means that
// once it reaches the end of that
// path, it continues following it
// and doesn't stop.
path_start(path_to_follow, move_speed, path_action_continue, true);