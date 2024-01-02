

global.MOVEABLE_PRIVATE_DURATION_IN_FRAMES_KEY = "duration_in_frames"; // counter

global.MOVEABLE_BASE_DURATION_IN_FRAMES_KEY = "base_duration_in_frames"; // czas od poczatku
global.MOVEABLE_VALUE_KEY = "value_key";

// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
function my_INHERITENCE_movable(_obj)
{
	my_INHERITENCE_directionangleable(_obj);
	my_INHERITENCE_specific_move_sprites(_obj);
	
	var _received_params = get_params_from_global_map(object_index);

	if (is_undefined(_received_params)) {
	    _received_params = {};
	}

	_initMoveable(_obj, _received_params);
	my_calculate_speed(_obj);

	// APPLY 
	//my_start_move_moveable_obj(_obj); 
}


function _initMoveable(_obj, _param_received_params)
{
	my_CONSTRUCTOR_default_moveable_init(_obj)
	if(my_object_has_field(_obj, "my_object_moveable_init_function") && 
		!is_undefined(_obj.my_object_moveable_init_function)) {
		_obj.my_object_moveable_init_function(_obj);
	}
	
	my_assign_movable_global_param(_obj, _param_received_params);
}



function my_assign_movable_global_param(_object_movable, _global_param_movable) {
    if (_global_param_movable == undefined) return;

	//show_debug_message("ustawiam my_assign_movable_global_param")
	//show_debug_message(string(_global_param_movable))

    if (variable_struct_exists(_global_param_movable, "my_is_moveable"))
        _object_movable.my_is_moveable = _global_param_movable.my_is_moveable;
    if (variable_struct_exists(_global_param_movable, "my_current_direction"))
		_object_movable.my_current_direction = _global_param_movable.my_current_direction;
    if (variable_struct_exists(_global_param_movable, "my_priv_current_speed"))
        _object_movable.my_priv_current_speed = _global_param_movable.my_priv_current_speed;
	if (variable_struct_exists(_global_param_movable, "my_priv_base_speed")) {
		my_set_base_speed(_object_movable, _global_param_movable.my_priv_base_speed);
	}
	if (variable_struct_exists(_global_param_movable, "my_priv_speed_modifiers")) {
		_object_movable.my_priv_speed_modifiers = _global_param_movable.my_priv_speed_modifiers;
	}
        
	if (variable_struct_exists(_global_param_movable, "my_priv_temp_speed"))
        _object_movable.my_priv_temp_speed = _global_param_movable.my_priv_temp_speed;
		
	if (variable_struct_exists(_global_param_movable, "my_trigger_direction_change"))
        _object_movable.my_trigger_direction_change = _global_param_movable.my_trigger_direction_change;
	if (variable_struct_exists(_global_param_movable, "my_object_moveable_init_function"))
        _object_movable.my_object_moveable_init_function = _global_param_movable.my_object_moveable_init_function;
}


function my_CONSTRUCTOR_default_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = true;
    _instance.my_current_direction = MY_Direction.RIGHT;
    _instance.my_trigger_direction_change = true;
    _instance.my_STATE_is_lock_direction = false;
	_instance.my_priv_base_speed = 0; // base character speed
	_instance.my_priv_current_speed = 0;
	
    _instance.my_priv_speed_modifiers = ds_map_create();
}

function my_DESTRUCTOR_moveable_resources(_obj) {
	ds_map_destroy(_obj.my_priv_speed_modifiers);
}

function my_set_base_speed(_obj, _value) {
	_obj.my_priv_base_speed = _value;
	_obj.my_priv_current_speed = _value;
}

function my_get_direction(_obj)
{
	if (!my_is_moveable_object(_obj)) return MY_Direction.RIGHT;
	return _obj.my_current_direction;
}

function my_set_direction(_obj, _value)
{
	if (!my_object_has_field(_obj, "my_current_direction")) {
		_obj.my_current_direction = MY_Direction.RIGHT;
	} else {
		_obj.my_current_direction = _value;
	}
}


function my_get_speed(_obj) {
    return _obj.my_priv_current_speed;
}

function my_calculate_speed(_obj) {
    var _current_speed = _obj.my_priv_base_speed;
	var keys = ds_map_keys_to_array(_obj.my_priv_speed_modifiers);
    
	for (var i = 0; i < array_length(keys); i++) {
	    var key = keys[i];
	    var modifier = _obj.my_priv_speed_modifiers[? key];
	    _current_speed *= modifier[global.MODIFICATOR_EFFECT_VALUE_KEY];
	}
	// musisz dodac sprawdzanie modyfikatora
    
    //ds_list_destroy(keys);  // pamiętaj o zwolnieniu zasobów!
	_obj.my_priv_current_speed = _current_speed;
	_obj.path_speed = _obj.my_priv_current_speed;
    return _obj.my_priv_current_speed;
}



function my_is_moveable_object(_obj)
{
	if (!my_object_has_field_and_is_true(_obj, "my_is_moveable")) return false;
	return _obj.my_is_moveable;
}

function get_speed_modifier(_obj) {
    return _obj.my_priv_speed_modifiers;
}

// PUBLIC
function PUBLIC_add_speed_modifier(_obj, _modifier_class) {
	_obj.my_priv_speed_modifiers[? _modifier_class[global.MODIFICATOR_SKILL_NAME_ID_KEY]] = 
		_modifier_class;
    _obj.my_priv_current_speed = my_calculate_speed(_obj);
    _obj.path_speed = _obj.my_priv_current_speed;
}

function my_is_movable_type_object(_object)
{
	if (!variable_instance_exists(_object, "MY_IS_TYPE_MOVEABLE")) return false;
	return _object.MY_IS_TYPE_MOVEABLE;
}

function my_start_move_moveable_obj(_object)
{
	if(_object.MY_IS_TYPE_MOVEABLE == false) return;

	_object.my_is_moveable = _object.my_is_moveable; // do ewentualnego uzycia
	if(_object.my_is_moveable == true)
	{
		_object.speed = my_get_speed(self);
	}
	//_object.direction = my_calculate_direction_value(_object.my_current_direction);
	//if(my_get_aim_angle(self) != undefined) {
		_object.direction = my_get_aim_angle(self);
	//} else {
	//	_object.direction = my_calculate_direction_value(_object.my_current_direction);
	//}
	
	
	my_adjust_obj_image_scale_and_angle(_object)
}


function my_calculate_offset(_direction_enum, _invoker_width)
{
	var _offset_factor = 0.4;
    var angle_deg = my_calculate_direction_value(_direction_enum);
    var angle_rad = degtorad(angle_deg);  // Konwersja ze stopni na radiany

    var offsetX = _invoker_width * _offset_factor  * cos(angle_rad);
    var offsetY = -_invoker_width * _offset_factor  * sin(angle_rad);  // Minus, ponieważ w wielu systemach współrzędnych wartość y rośnie w dół ekranu

    return [offsetX, offsetY];
}


function my_TRIGGER_direction_change(_obj) {
	_obj.my_trigger_direction_change = true;
}


// Funkcja do aktualizacji sprite'a w zależności od wciśniętych klawiszy
function my_calculate_direction_and_sprite(_obj) {
	
	//	show_debug_message("my_get_speed " + string(my_get_speed(_obj)))
	//show_debug_message("_obj " + string(_obj.speed))
	if(_obj.speed < 0.1 && my_get_speed(_obj) < 0.1) {
		my_update_IDLE_sprite(_obj);
		_obj.image_index += 0;
		return;
	}
	
    // Sprawdzenie wciśniętych klawiszy
    if (!_obj.my_STATE_is_lock_direction && _obj.my_trigger_direction_change) {
        if (keyboard_check(vk_up)) {
            if (keyboard_check(vk_left)) {
                _obj.my_current_direction = MY_Direction.UP_LEFT;
                my_update_UP_LEFT_sprite(_obj);
            } else if (keyboard_check(vk_right)) {
                _obj.my_current_direction = MY_Direction.UP_RIGHT;
                my_update_UP_RIGHT_sprite(_obj);
            } else {
                _obj.my_current_direction = MY_Direction.UP;
                my_update_UP_sprite(_obj);
            }
        } else if (keyboard_check(vk_down)) {
            if (keyboard_check(vk_left)) {
                _obj.my_current_direction = MY_Direction.DOWN_LEFT;
                my_update_DOWN_LEFT_sprite(_obj);
            } else if (keyboard_check(vk_right)) {
                _obj.my_current_direction = MY_Direction.DOWN_RIGHT;
                my_update_DOWN_RIGHT_sprite(_obj);
            } else {
                _obj.my_current_direction = MY_Direction.DOWN;
                my_update_DOWN_sprite(_obj);
            }
        } else if (keyboard_check(vk_left)) {
            _obj.my_current_direction = MY_Direction.LEFT;
            my_update_LEFT_sprite(_obj);
        } else if (keyboard_check(vk_right)) {
            _obj.my_current_direction = MY_Direction.RIGHT;
            my_update_RIGHT_sprite(_obj);
        }
    }
	
	_obj.my_trigger_direction_change = false;
	_obj.image_index += 0;
}













