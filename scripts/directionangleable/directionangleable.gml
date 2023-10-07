// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
function my_INHERITENCE_directionangleable(_obj)
{
	var _received_params = get_params_from_global_map(_obj.object_index);

	if (is_undefined(_received_params)) {
	    _received_params = {};
	}
	
	my_CONSTRUCTOR_default_directionangleable_init(_obj)
	my_assign_directionangleable_global_param(self, _received_params);
}

function my_get_aim_angle(_obj)
{
	if (!my_object_has_field(_obj, "my_priv_aim_angle")) return;
	return _obj.my_priv_aim_angle;
}

function my_set_aim_angle(_obj, _value)
{
	if (!my_object_has_field(_obj, "my_priv_aim_angle")) return;
	_obj.my_priv_aim_angle = _value;
}



function my_assign_directionangleable_global_param(_object_movable, _global_param_movable) {
    if (_global_param_movable == undefined) return;

	//show_debug_message("ustawiam: " + string(_global_param_movable))
    if (variable_struct_exists(_global_param_movable, "my_priv_aim_angle")) {
		//show_debug_message("ustawiam: " + string(_global_param_movable.my_attach_to_obj))
        _object_movable.my_priv_aim_angle = _global_param_movable.my_priv_aim_angle;
	}
}

function my_CONSTRUCTOR_default_directionangleable_init(_instance) {
    _instance.my_priv_aim_angle = direction;
}


function my_load_direction_arrow_gui(_invoker_obj)
{
	if(!my_is_moveable_object(_invoker_obj)) return;
	
	var _constr_params = {}; // przekazanie parametrow do tworzoenego obiektu
	_constr_params.my_attach_to_obj = _invoker_obj;
	
	my_skill_invoke_2(_invoker_obj, _invoker_obj.x, _invoker_obj.y, 
		"Instances", DirectionArrow, my_get_direction(_invoker_obj), _constr_params)
		
}


function my_aim_calculate_aim_angle(_object)
{
	var horz = 0;
    var vert = 0;

    if (keyboard_check(vk_left)) horz -= 1; 
    if (keyboard_check(vk_right)) horz += 1; 
    if (keyboard_check(vk_down)) vert -= 1; // Zmieniamy znak dla strzałki w dół
    if (keyboard_check(vk_up)) vert += 1;   // Zmieniamy znak dla strzałki w górę

    // Odwracamy wartość vert, aby dostosować się do układu współrzędnych w GameMaker
    vert = -vert;

    if (horz != 0 || vert != 0) {
        var target_angle = point_direction(0, 0, horz, vert);
        //var closest_angle = closest_multiples_of_45(target_angle);
        var diff_angle = modified_angle_difference(my_get_aim_angle(_object), target_angle);

        var rotation_speed = 4;

        //if (abs(modified_angle_difference(target_angle, closest_angle)) < 1) {
        //    target_angle = closest_angle;
        //}

        if (abs(diff_angle) < rotation_speed) {
            my_set_aim_angle(_object, target_angle);
        } else {
            my_set_aim_angle(_object, my_get_aim_angle(_object) + sign(diff_angle) * rotation_speed);
        }

        // Ogranicz aim_angle do zakresu 0-360
        if (my_get_aim_angle(_object) >= 360) {
            my_set_aim_angle(_object, my_get_aim_angle(_object) - 360);
        }
        if (my_get_aim_angle(_object) < 0) {
            my_set_aim_angle(_object, my_get_aim_angle(_object) + 360);
        }
    }
}


function my_adjust_obj_image_scale_and_angle(_object)
{
		// Resetowanie wartości
    _object.image_xscale = 1;
    _object.image_yscale = 1;
    _object.image_angle = 0;
	_object.image_speed = 1;

    // Wizualne dostosowanie w oparciu o kierunek:
    switch(_object.my_current_direction)
    {
        case MY_Direction.LEFT:
            _object.image_xscale = -1; 
            break;

        case MY_Direction.RIGHT:
			_object.image_xscale = 1; 
            break;

        case MY_Direction.UP:
            //_object.image_angle = 180; 
			_object.image_xscale = -1; 
			_object.image_angle = -90;
            break;

        case MY_Direction.DOWN:
            _object.image_angle = -90;
            break;

        case MY_Direction.UP_LEFT:
            _object.image_angle = 135; 
            break;

        case MY_Direction.UP_RIGHT:
            //_object.image_angle = -135;
			_object.image_angle = 45; 
            break;

        case MY_Direction.DOWN_LEFT:
			_object.image_angle = -135;
            //_object.image_angle = 45; 
            break;

        case MY_Direction.DOWN_RIGHT:
            _object.image_angle = -45; 
            break;

        default:
            break;
    }
}

function my_calculate_direction_value(_direction_enum)
{
	switch(_direction_enum)
    {
        case MY_Direction.UP:
            return 90;
        case MY_Direction.DOWN:
            return 270;
        case MY_Direction.LEFT:
            return 180;
        case MY_Direction.RIGHT:
            return 0;
		case MY_Direction.UP_LEFT:
            return 135;
		case MY_Direction.UP_RIGHT:
            return 45; 
		case MY_Direction.DOWN_LEFT:
            return 225;
		case MY_Direction.DOWN_RIGHT:
            return 315;
    }
	return 0;
}

function my_calculate_direction_enum(_angle) {
    // Normalizuj kąt do zakresu 0-360
    _angle = _angle % 360;
    if (_angle < 0) _angle += 360;

    // Sprawdź zakresy kątów
    if (_angle >= 67.5 && _angle < 112.5) {
        return MY_Direction.UP;
    }
    if (_angle >= 247.5 && _angle < 292.5) {
        return MY_Direction.DOWN;
    }
    if (_angle >= 157.5 && _angle < 202.5) {
        return MY_Direction.LEFT;
    }
    if (_angle >= 337.5 || _angle < 22.5) {
        return MY_Direction.RIGHT;
    }
    if (_angle >= 112.5 && _angle < 157.5) {
        return MY_Direction.UP_LEFT;
    }
    if (_angle >= 22.5 && _angle < 67.5) {
        return MY_Direction.UP_RIGHT;
    }
    if (_angle >= 202.5 && _angle < 247.5) {
        return MY_Direction.DOWN_LEFT;
    }
    if (_angle >= 292.5 && _angle < 337.5) {
        return MY_Direction.DOWN_RIGHT;
    }
    return -1; // Błąd, nieznany kierunek
}


function modified_angle_difference(angle1, angle2) {
    var diff = (angle2 - angle1) mod 360;

    if (diff > 180) {
        diff -= 360;
    }

    if (diff < -180) {
        diff += 360;
    }

    if (diff == -180) {
        return 180;
    }

    return diff;
}




//function my_skill_invoke(_invoker_obj, _x, _y, _layer, _skill_obj, _opt_direction) 
//{
//	var _invoker_width = sprite_get_width(_invoker_obj.sprite_index);
//    var _invoker_height = sprite_get_height(_invoker_obj.sprite_index);
	
//	var offsetX = 0; // 
//    var offsetY = 0; // dodac parametry do invokera
    
//	var offsets = my_calculate_offset(_opt_direction, _invoker_width);
//	offsetX += offsets[0];
//	offsetY += offsets[1];
	
//	var _constr_params = {}; // przekazanie parametrow do tworzoenego obiektu
//	_constr_params.my_current_direction = _opt_direction
	
//	add_params_for_new_obj(_skill_obj, _constr_params)
	
//	instance_create_layer(_x + offsetX, _y + offsetY, _layer, _skill_obj);
//}