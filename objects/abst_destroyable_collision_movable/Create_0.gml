event_inherited();

setSpriteAndMirror = function (_self, _speed_x, _speed_y) {
	with(_self) {
		image_yscale = 1; // reverse

	    if (_speed_x > 0) {
	        image_xscale = 1;
	        sprite_index = self.my_sprite_MOVEABLE_RIGHT;
	    }
	    else if (_speed_x < 0) {
	        image_xscale = -1;
	        sprite_index = self.my_sprite_MOVEABLE_LEFT;
	    }
	    else if (_speed_y > 0) {
	        sprite_index = self.my_sprite_MOVEABLE_DOWN;
	    }
	    else if (_speed_y < 0) {
	        sprite_index = self.my_sprite_MOVEABLE_UP;
	    }
	    else {
	        sprite_index = self.my_sprite_MOVEABLE_IDLE;
	    }
	}
}