event_inherited();

// Check if the player is colliding with an elliptical
// area surrounding the baddie
// Its size is 100 pixels around the baddie (using
// the relative option)
var l563A63E1_0 = collision_ellipse(x + -100, y + -100, x + 100, y + 100, obj_player, true, 1);
if((l563A63E1_0))
{
	// Then check if the baddie is
	// not attacking right now
	if(attacking == false)
	{
		// In that case, set 'attacking'
		// to true so it starts attacking
		attacking = true;
	
		// Set the path follow speed
		// to 0 so it stops moving
		path_speed = 0;
	
		// Get the distance to the player
		// on the X axis
		var dist_x = obj_player.x - x;
	
		// Get the distance to the player
		// on the Y axis
		var dist_y = obj_player.y - y;
	
		// If the X distance is less than -50
		// meaning the player is to the
		// LEFT of the baddie
		if(dist_x < -50)
		{
			// Switch to the 'side attack'
			// sprite
			sprite_index = spr_baddie_attack_side;
			image_index = 0;
		
			// Flip the sprite so it faces left
			// instead of right
			image_xscale = -1;
			image_yscale = 1;
		}
	
		// Otherwise,
		else
		{
			// If the X distance is greater than
			// 50 meaning the player is to the
			// RIGHT of the baddie
			if(dist_x > 50)
			{
				// Switch to the 'side attack'
				// sprite
				sprite_index = spr_baddie_attack_side;
				image_index = 0;
			
				// But keep its original scale
				// so it faces right
				image_xscale = 1;
				image_yscale = 1;
			}
		
			// Otherwise,
			else
			{
				// If the Y distance is less than -50
				// meaning the player is ABOVE the
				// baddie
				if(dist_y < -30)
				{
					// Switch to the 'up attack'
					// sprite
					sprite_index = spr_baddie_attack_up;
					image_index = 0;
				}
			
				// Otherwise,
				else
				{
					// Switch to the 'down attack'
					// sprite as that's the only
					// direction left
					sprite_index = spr_baddie_attack_down;
					image_index = 0;
				}
			}
		}
	}
}