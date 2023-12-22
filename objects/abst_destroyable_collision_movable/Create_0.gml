var sprite_id = sprite_index; // Identyfikator sprite'a
var sprite_name = sprite_get_name(sprite_id); // Nazwa sprite'a
show_debug_overlay(true)
show_debug_message("TWORZE OBIEKT" + string(sprite_name));

setSpriteAndMirror = function (_self, _speed_x, _speed_y) {
	with(_self) {
		_self.image_yscale = 1;

	    if (_speed_x > 0) {
	        _self.image_xscale = 1;
	        _self.sprite_index = self.my_sprite_MOVEABLE_RIGHT;
	    }
	    else if (_speed_x < 0) {
	        _self.image_xscale = -1;
	        _self.sprite_index = self.my_sprite_MOVEABLE_LEFT;
	    }
	    else if (_speed_y > 0) {
	        _self.sprite_index = self.my_sprite_MOVEABLE_DOWN;
	    }
	    else if (_speed_y < 0) {
	        _self.sprite_index = self.my_sprite_MOVEABLE_UP;
	    }
	    else {
	        _self.sprite_index = self.my_sprite_MOVEABLE_IDLE;
	    }
	}
}

event_inherited();

