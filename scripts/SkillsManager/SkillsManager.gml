// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
function my_skill_invoke(_invoker_obj, _x, _y, _layer, _skill_obj, _opt_direction) 
{
	my_skill_invoke_2(_invoker_obj, _x, _y, _layer, _skill_obj, _opt_direction, undefined)
}

function my_skill_invoke_2(_invoker_obj, _x, _y, _layer, _skill_obj, _opt_direction, _additional_params) 
{
	my_skill_invoke_3(_invoker_obj, _x, _y, _layer, _skill_obj, _opt_direction, my_calculate_direction_value(_opt_direction), _additional_params)
}



function my_skill_invoke_3(_invoker_obj, _x, _y, _layer, _skill_obj, _opt_direction, _aim_angle, _additional_params) 
{
	var _invoker_width = sprite_get_width(_invoker_obj.sprite_index);
    var _invoker_height = sprite_get_height(_invoker_obj.sprite_index);
	
	var _offsetX = 0;
    var _offsetY = 0;
	

    
	var offsets = my_calculate_offset(_opt_direction, _invoker_width);
	_offsetX += offsets[0];
	_offsetY += offsets[1];
	
	var _constr_params = {};
	_constr_params.my_current_direction = _opt_direction
	_constr_params.my_priv_aim_angle = _aim_angle
	_constr_params.my_invoker = _invoker_obj
	
	my_copy_parameters_to_from_struct(_constr_params, _additional_params);

	add_params_for_new_obj(_skill_obj, _constr_params)
	//add_params_byName_for_new_obj(global.SKILL_CONSTRUCTOR_PARAMS, _constr_params)
	
	instance_create_layer(_x + _offsetX, _y + _offsetY, _layer, _skill_obj);
}





















    //switch(_opt_direction) 
    //{
    //    case MY_Direction.UP:
    //        offsetX = _invoker_width/2 - 1;
	//		offsetY = -_invoker_height/2 + 1;
    //        break;
        
    //    case MY_Direction.DOWN:
    //        offsetX = _invoker_width/2 - 1;
    //        offsetY = _invoker_height/2 - 1;  // Dodałem przesunięcie względem wysokości _invoker'a.
    //        break;

    //    case MY_Direction.LEFT:
    //        offsetY += -_invoker_height/2;
	//		offsetX = -_invoker_width/2 + 1;
    //        break;

    //    case MY_Direction.RIGHT:
    //        offsetY += -_invoker_height/2;
	//		offsetX = _invoker_width/2 - 1;
    //        break;

	//	case MY_Direction.DOWN_LEFT:
	//	    offsetX = 0;  // Minimalne przesunięcie w lewo
	//	    offsetY = _invoker_height/2;
	//	    break;

    //    case MY_Direction.DOWN_RIGHT:
    //        offsetX = _invoker_width/2;
	//		offsetY = 0;
    //        break;

    //    case MY_Direction.UP_LEFT:
    //        offsetX = -_invoker_width + 1;
    //        offsetY = -_invoker_height + 1;
    //        break;

    //    case MY_Direction.UP_RIGHT:
    //        offsetX = _invoker_width - 1;
    //        offsetY = -_invoker_height + 1;
    //        break;

    //    default:
    //        break;
    //}