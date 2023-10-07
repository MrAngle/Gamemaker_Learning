function my_INHERITENCE_specific_move_sprites(_obj)
{
	_obj.my_current_direction = my_get_direction(_obj)
	
	var _received_params = get_params_from_global_map(_obj.object_index);

	if (is_undefined(_received_params)) {
	    _received_params = {};
	}

	_initSpecificMoveSprites(_obj, _received_params);
	
	my_adjust_diagonal_sprites(_obj);

	// APPLY 
	//my_start_move_moveable_obj(_obj); 
}


function _initSpecificMoveSprites(_obj, _param_received_params) {
	my_CONSTRUCTOR_default_sprites_init(_obj);
	if(my_object_has_field(_obj, "my_object_specific_sprites_init_function") && 
		!is_undefined(_obj.my_object_specific_sprites_init_function)) {
		_obj.my_object_specific_sprites_init_function(_obj);
	}

    my_assign_specific_sprites_global_param(_obj, _param_received_params);
}


function my_assign_specific_sprites_global_param(_object_sprite, _global_param_sprite) {
    if (_global_param_sprite == undefined) return;

    if (variable_struct_exists(_global_param_sprite, "my_specific_move_sprites")) {
        _object_sprite.my_specific_move_sprites = _global_param_sprite.my_specific_move_sprites;
    }
    
    if (variable_struct_exists(_global_param_sprite, "my_sprite_MOVEABLE_UP")) {
        _object_sprite.my_sprite_MOVEABLE_UP = _global_param_sprite.my_sprite_MOVEABLE_UP;
    }

    if (variable_struct_exists(_global_param_sprite, "my_sprite_MOVEABLE_DOWN")) {
        _object_sprite.my_sprite_MOVEABLE_DOWN = _global_param_sprite.my_sprite_MOVEABLE_DOWN;
    }

    if (variable_struct_exists(_global_param_sprite, "my_sprite_MOVEABLE_LEFT")) {
        _object_sprite.my_sprite_MOVEABLE_LEFT = _global_param_sprite.my_sprite_MOVEABLE_LEFT;
    }

    if (variable_struct_exists(_global_param_sprite, "my_sprite_MOVEABLE_RIGHT")) {
        _object_sprite.my_sprite_MOVEABLE_RIGHT = _global_param_sprite.my_sprite_MOVEABLE_RIGHT;
    }

    if (variable_struct_exists(_global_param_sprite, "my_sprite_MOVEABLE_UP_LEFT")) {
        _object_sprite.my_sprite_MOVEABLE_UP_LEFT = _global_param_sprite.my_sprite_MOVEABLE_UP_LEFT;
    }

    if (variable_struct_exists(_global_param_sprite, "my_sprite_MOVEABLE_UP_RIGHT")) {
        _object_sprite.my_sprite_MOVEABLE_UP_RIGHT = _global_param_sprite.my_sprite_MOVEABLE_UP_RIGHT;
    }

    if (variable_struct_exists(_global_param_sprite, "my_sprite_MOVEABLE_DOWN_LEFT")) {
        _object_sprite.my_sprite_MOVEABLE_DOWN_LEFT = _global_param_sprite.my_sprite_MOVEABLE_DOWN_LEFT;
    }

    if (variable_struct_exists(_global_param_sprite, "my_sprite_MOVEABLE_DOWN_RIGHT")) {
        _object_sprite.my_sprite_MOVEABLE_DOWN_RIGHT = _global_param_sprite.my_sprite_MOVEABLE_DOWN_RIGHT;
    }
	
	if (variable_struct_exists(_global_param_sprite, "my_sprite_MOVEABLE_IDLE")) {
        _object_sprite.my_sprite_MOVEABLE_IDLE = _global_param_sprite.my_sprite_MOVEABLE_IDLE;
    }
}



function my_CONSTRUCTOR_default_sprites_init(_instance) {

    //_instance.my_object_specific_sprites_init_function = undefined;
	
	var _default_sprite = _instance.sprite_index;

	_instance.my_sprite_MOVEABLE_UP = undefined;
	_instance.my_sprite_MOVEABLE_DOWN = undefined;
	_instance.my_sprite_MOVEABLE_LEFT = undefined;
	_instance.my_sprite_MOVEABLE_RIGHT = undefined;
	_instance.my_sprite_MOVEABLE_UP_LEFT = undefined;
	_instance.my_sprite_MOVEABLE_UP_RIGHT = undefined;
	_instance.my_sprite_MOVEABLE_DOWN_LEFT = undefined;
	_instance.my_sprite_MOVEABLE_DOWN_RIGHT = undefined;
	_instance.my_sprite_MOVEABLE_IDLE = undefined;
}

function my_adjust_diagonal_sprites(_object_sprite) {
    // Jeśli RIGHT jest ustawione, ale UP_RIGHT i DOWN_RIGHT nie są
    if (_object_sprite.my_sprite_MOVEABLE_RIGHT != undefined &&
        (_object_sprite.my_sprite_MOVEABLE_UP_RIGHT == undefined || _object_sprite.my_sprite_MOVEABLE_DOWN_RIGHT == undefined)) {
        if (_object_sprite.my_sprite_MOVEABLE_UP_RIGHT == undefined) {
            _object_sprite.my_sprite_MOVEABLE_UP_RIGHT = _object_sprite.my_sprite_MOVEABLE_RIGHT;
        }
        if (_object_sprite.my_sprite_MOVEABLE_DOWN_RIGHT == undefined) {
            _object_sprite.my_sprite_MOVEABLE_DOWN_RIGHT = _object_sprite.my_sprite_MOVEABLE_RIGHT;
        }
    }

    // Analogicznie dla innych kierunków
    if (_object_sprite.my_sprite_MOVEABLE_LEFT != undefined &&
        (_object_sprite.my_sprite_MOVEABLE_UP_LEFT == undefined || _object_sprite.my_sprite_MOVEABLE_DOWN_LEFT == undefined)) {
        if (_object_sprite.my_sprite_MOVEABLE_UP_LEFT == undefined) {
            _object_sprite.my_sprite_MOVEABLE_UP_LEFT = _object_sprite.my_sprite_MOVEABLE_LEFT;
        }
        if (_object_sprite.my_sprite_MOVEABLE_DOWN_LEFT == undefined) {
            _object_sprite.my_sprite_MOVEABLE_DOWN_LEFT = _object_sprite.my_sprite_MOVEABLE_LEFT;
        }
    }

    if (_object_sprite.my_sprite_MOVEABLE_UP != undefined &&
        (_object_sprite.my_sprite_MOVEABLE_UP_LEFT == undefined || _object_sprite.my_sprite_MOVEABLE_UP_RIGHT == undefined)) {
        if (_object_sprite.my_sprite_MOVEABLE_UP_LEFT == undefined) {
            _object_sprite.my_sprite_MOVEABLE_UP_LEFT = _object_sprite.my_sprite_MOVEABLE_UP;
        }
        if (_object_sprite.my_sprite_MOVEABLE_UP_RIGHT == undefined) {
            _object_sprite.my_sprite_MOVEABLE_UP_RIGHT = _object_sprite.my_sprite_MOVEABLE_UP;
        }
    }

    if (_object_sprite.my_sprite_MOVEABLE_DOWN != undefined &&
        (_object_sprite.my_sprite_MOVEABLE_DOWN_LEFT == undefined || _object_sprite.my_sprite_MOVEABLE_DOWN_RIGHT == undefined)) {
        if (_object_sprite.my_sprite_MOVEABLE_DOWN_LEFT == undefined) {
            _object_sprite.my_sprite_MOVEABLE_DOWN_LEFT = _object_sprite.my_sprite_MOVEABLE_DOWN;
        }
        if (_object_sprite.my_sprite_MOVEABLE_DOWN_RIGHT == undefined) {
            _object_sprite.my_sprite_MOVEABLE_DOWN_RIGHT = _object_sprite.my_sprite_MOVEABLE_DOWN;
        }
    }
}



function getCurrentDirectionSprite(_instance) {
    switch (_instance.my_current_direction) {
        case MY_Direction.UP:
            return _instance.spr_MOVEABLE_UP;

        case MY_Direction.DOWN:
            return _instance.spr_MOVEABLE_DOWN;

        case MY_Direction.LEFT:
            return _instance.spr_MOVEABLE_LEFT;

        case MY_Direction.RIGHT:
            return _instance.spr_MOVEABLE_RIGHT;

        case MY_Direction.UP_LEFT:
            return _instance.spr_MOVEABLE_UP_LEFT;

        case MY_Direction.UP_RIGHT:
            return _instance.spr_MOVEABLE_UP_RIGHT;

        case MY_Direction.DOWN_LEFT:
            return _instance.spr_MOVEABLE_DOWN_LEFT;

        case MY_Direction.DOWN_RIGHT:
            return _instance.spr_MOVEABLE_DOWN_RIGHT;

        default:
            return spr_Player_Idle;  // Domyślny sprite
    }
}

//function my_update_LEFT_sprite(_obj) {
//	//if(!my_STATE_is_lock_direction) {
//		sprite_index = _obj.my_sprite_MOVEABLE_LEFT;
//		image_index += 0;

//		image_xscale = -1;
//		image_yscale = 1;
//	//}
//}

// Funkcja do aktualizacji sprite'a w kierunku w lewo
function my_update_LEFT_sprite(_obj) {
    _obj.sprite_index = _obj.my_sprite_MOVEABLE_LEFT;
    //_obj.image_index += 0;
    _obj.image_xscale = -1;
    _obj.image_yscale = 1;
}

// Analogiczne funkcje dla innych kierunków
function my_update_UP_sprite(_obj) {
    _obj.sprite_index = _obj.my_sprite_MOVEABLE_UP;
    //_obj.image_index += 0;
    _obj.image_xscale = 1;
    _obj.image_yscale = 1;
}

function my_update_DOWN_sprite(_obj) {
    _obj.sprite_index = _obj.my_sprite_MOVEABLE_DOWN;
    //_obj.image_index += 0;
    _obj.image_xscale = 1;
    _obj.image_yscale = 1;
}

function my_update_RIGHT_sprite(_obj) {
    _obj.sprite_index = _obj.my_sprite_MOVEABLE_RIGHT;
    //_obj.image_index += 0;
    _obj.image_xscale = 1;
    _obj.image_yscale = 1;
}

function my_update_UP_LEFT_sprite(_obj) {
    _obj.sprite_index = _obj.my_sprite_MOVEABLE_UP_LEFT;
    //_obj.image_index += 0;
    _obj.image_xscale = -1;
    _obj.image_yscale = 1;
}

function my_update_UP_RIGHT_sprite(_obj) {
    _obj.sprite_index = _obj.my_sprite_MOVEABLE_UP_RIGHT;
    //_obj.image_index += 0;
    _obj.image_xscale = 1;
    _obj.image_yscale = 1;
}

function my_update_DOWN_LEFT_sprite(_obj) {
    _obj.sprite_index = _obj.my_sprite_MOVEABLE_DOWN_LEFT;
    //_obj.image_index += 0;
    _obj.image_xscale = -1;
    _obj.image_yscale = 1;
}

function my_update_DOWN_RIGHT_sprite(_obj) {
    _obj.sprite_index = _obj.my_sprite_MOVEABLE_DOWN_RIGHT;
    //_obj.image_index += 0;
    _obj.image_xscale = 1;
    _obj.image_yscale = 1;
}

function my_update_IDLE_sprite(_obj) {
    _obj.sprite_index = _obj.my_sprite_MOVEABLE_IDLE;
    //_obj.image_index += 0;
    //_obj.image_xscale = 1;
    //_obj.image_yscale = 1;
}