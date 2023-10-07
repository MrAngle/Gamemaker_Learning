// Add move_speed to
// X so it moves right
x += my_get_speed(self);


if(!my_STATE_is_lock_direction) {
// Walk to side sprite
sprite_index = spr_player_walk_side;
image_index += 0;

// Reset the horizontal scale
// to 1 so the player faces
// right again
image_xscale = 1;
image_yscale = 1;

}