// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
function my_INHERITENCE_movable(_obj)
{
	my_INHERITENCE_directionangleable(_obj);
	
	var _received_params = get_params_from_global_map(object_index);

	if (is_undefined(_received_params)) {
	    _received_params = {};
	}

	_initMoveable(_obj, _received_params);

	// APPLY 
	//my_start_move_moveable_obj(_obj); 
}


function _initMoveable(_obj, _param_received_params)
{
	if(!my_object_has_field(_obj, "my_object_moveable_init_function") || is_undefined(_obj.my_object_moveable_init_function))
	{
		_obj.my_object_moveable_init_function = my_CONSTRUCTOR_default_moveable_init;
	}

	_obj.my_object_moveable_init_function(self);
	my_assign_movable_global_param(self, _param_received_params);
}

function my_get_speed(_obj)
{
	if (!my_object_has_field_and_is_true(_obj, "my_is_moveable")) return;
	return _obj.my_priv_speed;
}

function my_get_direction(_obj)
{
	if (!my_is_moveable_object(_obj)) return MY_Direction.RIGHT;
	return _obj.my_current_direction;
}

function my_set_speed(_obj, _value)
{
	if (!my_object_has_field_and_is_true(_obj, "my_is_moveable")) return;
	_obj.my_priv_speed = _value;
}

function my_is_moveable_object(_obj)
{
	if (!my_object_has_field_and_is_true(_obj, "my_is_moveable")) return false;
	return _obj.my_is_moveable;
}



function my_assign_movable_global_param(_object_movable, _global_param_movable) {
    if (_global_param_movable == undefined) return;

	//show_debug_message("ustawiam my_assign_movable_global_param")
	//show_debug_message(string(_global_param_movable))

    if (variable_struct_exists(_global_param_movable, "my_is_moveable"))
        _object_movable.my_is_moveable = _global_param_movable.my_is_moveable;
    if (variable_struct_exists(_global_param_movable, "my_current_direction"))
		_object_movable.my_current_direction = _global_param_movable.my_current_direction;
    if (variable_struct_exists(_global_param_movable, "my_priv_speed"))
        _object_movable.my_priv_speed = _global_param_movable.my_priv_speed;
	if (variable_struct_exists(_global_param_movable, "my_object_moveable_init_function"))
        _object_movable.my_object_moveable_init_function = _global_param_movable.my_object_moveable_init_function;
}


function my_CONSTRUCTOR_default_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = true;
    _instance.my_current_direction = MY_Direction.RIGHT;
    _instance.my_priv_speed = 0;
    _instance.my_object_moveable_init_function = undefined;
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
	if(my_get_aim_angle(self) != undefined) {
		_object.direction = my_get_aim_angle(self);
	} else {
		_object.direction = my_calculate_direction_value(_object.my_current_direction);
	}
	
	
	my_adjust_obj_image_scale_and_angle(_object)
}


function my_calculate_offset(_direction_enum, _invoker_width)
{
    var angle_deg = my_calculate_direction_value(_direction_enum);
    var angle_rad = degtorad(angle_deg);  // Konwersja ze stopni na radiany

    var offsetX = _invoker_width * cos(angle_rad);
    var offsetY = -_invoker_width * sin(angle_rad);  // Minus, ponieważ w wielu systemach współrzędnych wartość y rośnie w dół ekranu

    return [offsetX, offsetY];
}

























function DEPRECATED_my_calculate_offsets_old()
{
	var offsetDiagonal = _invoker_width / sqrt(2);

	switch(_opt_direction) 
	{
	    case MY_Direction.UP:
	        offsetY = -_invoker_height;
	        break;

	    case MY_Direction.DOWN:
	        offsetY = _invoker_height;
	        break;

	    case MY_Direction.LEFT:
	        offsetX = -_invoker_width;
	        break;

	    case MY_Direction.RIGHT:
	        offsetX = _invoker_width;
	        break;

	    case MY_Direction.DOWN_LEFT:
	        offsetX = -offsetDiagonal;
	        offsetY = offsetDiagonal;
	        break;

	    case MY_Direction.DOWN_RIGHT:
	        offsetX = offsetDiagonal;
	        offsetY = offsetDiagonal;
	        break;

	    case MY_Direction.UP_LEFT:
	        offsetX = -offsetDiagonal;
	        offsetY = -offsetDiagonal;
	        break;

	    case MY_Direction.UP_RIGHT:
	        offsetX = offsetDiagonal;
	        offsetY = -offsetDiagonal;
	        break;

	    default:
	        break;
	}

}


	// // Oblicz image_xscale i image_yscale na podstawie kierunku


    //var _direction = _object.direction;
    //_object.image_xscale = 1; // Domyślna skala w poziomie (nieodwrócona)
    //_object.image_yscale = 1; // Domyślna skala w pionie (nieodwrócona)

    //if (_direction == 90)
    //{
    //    // Góra
    //    _object.image_yscale = -1;
    //}
    //else if (_direction == 270)
    //{
    //    // Dół
    //    _object.image_yscale = 1;
    //}
    //else if (_direction == 180)
    //{
    //    // Lewo
    //    _object.image_xscale = -1;
    //}
    //else if (_direction == 0)
    //{
    //    // Prawo
    //    _object.image_xscale = 1;
    //}
    //else if (_direction == 135)
    //{
    //    // Skos w lewo-góra
    //    _object.image_yscale = -1;
    //    _object.image_xscale = -1;
    //}
    //else if (_direction == 225)
    //{
    //    // Skos w lewo-dół
    //    _object.image_yscale = 1;
    //    _object.image_xscale = -1;
    //}
    //else if (_direction == 315)
    //{
    //    // Skos w prawo-dół
    //    _object.image_yscale = 1;
    //    _object.image_xscale = 1;
    //}
    //else if (_direction == 45)
    //{
    //    // Skos w prawo-góra
    //    _object.image_yscale = -1;
    //    _object.image_xscale = 1;
    //}