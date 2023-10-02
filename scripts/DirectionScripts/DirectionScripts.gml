// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
function my_load_direction_arrow_gui(_invoker_obj)
{
	if(!my_is_moveable_object(_invoker_obj)) return;
	
	var _constr_params = {}; // przekazanie parametrow do tworzoenego obiektu
	_constr_params.my_attach_to_obj = _invoker_obj;
	
	my_skill_invoke_2(_invoker_obj, _invoker_obj.x, _invoker_obj.y, 
		"Instances", DirectionArrow, my_get_direction(_invoker_obj), _constr_params)
		
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