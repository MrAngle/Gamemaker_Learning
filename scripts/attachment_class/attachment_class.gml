// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
function my_INHERITENCE_attachment(_obj)
{
	var _received_params = get_params_from_global_map(_obj.object_index);

	if (is_undefined(_received_params)) {
	    _received_params = {};
	}
	
	my_CONSTRUCTOR_default_attachment_init(_obj)
	my_assign_attachment_global_param(self, _received_params);
}

function my_assign_attachment_global_param(_object_movable, _global_param_movable) {
    if (_global_param_movable == undefined) return;

	//show_debug_message("ustawiam: " + string(_global_param_movable))
    if (variable_struct_exists(_global_param_movable, "my_attach_to_obj")) {
		//show_debug_message("ustawiam: " + string(_global_param_movable.my_attach_to_obj))
        _object_movable.my_attach_to_obj = _global_param_movable.my_attach_to_obj;
	}
}

function my_CONSTRUCTOR_default_attachment_init(_instance) {
    _instance.my_attach_to_obj = self;
}

function my_attach_to_obj_function(_obj) {
	my_attach_to_obj_with_offsets(_obj, 0, 0);
}

function my_attach_to_obj_with_offsets(_obj, _x_offset, _y_offset) {

	//if (!instance_exists(_obj.my_attach_to_obj)) return
	
	//show_debug_message("my_attach_init x: " + string(_obj.my_attach_to_obj.x))
	//show_debug_message("my_attach_init y: " + string(_obj.my_attach_to_obj.y))
	
	//show_debug_message("_x_offset x: " + string(_x_offset))
	//show_debug_message("_y_offset y: " + string(_y_offset))
	
	//show_debug_message("my_attach_init: " + string(_obj.my_attach_to_obj.x))
    _obj.x = _obj.my_attach_to_obj.x + _x_offset;  // Przesuń obiekt podążający na pozycję x obiektu śledzonego
    _obj.y = _obj.my_attach_to_obj.y + _y_offset;  // Przesuń obiekt podążający na pozycję y obiektu śledzonego
}

