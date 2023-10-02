// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
function my_use_mocked_collision_mask(_object) 
{
	if(!my_is_movable_type_object(_object)) {
		_object.mask_index = MY_MOCKED_COLLISION_MASK;
	}
	
	switch(_object.my_current_direction)
	{
		// I dont know why it working in that way... but it working
	    case MY_Direction.LEFT:
	    case MY_Direction.RIGHT:
	    case MY_Direction.DOWN_RIGHT:
	    case MY_Direction.DOWN:
	        //_object.image_xscale = -1;
	        _object.mask_index = MY_MOCKED_COLLISION_MASK_2;
	        break;

	    //case MY_Direction.RIGHT:
	    //    _object.image_xscale = 1;
	    //    _object.mask_index = MY_MOCKED_COLLISION_MASK_RIGHT;
	    //    break;

	    //case MY_Direction.UP:
	    //    _object.image_angle = -90;
	    //    _object.mask_index = MY_MOCKED_COLLISION_MASK_UP;
	    //    break;

	    //case MY_Direction.DOWN:
	    //    _object.image_angle = -90;
	    //    _object.mask_index = MY_MOCKED_COLLISION_MASK_DOWN;
	    //    break;

	    //case MY_Direction.UP_LEFT:
	    //    _object.image_angle = 135;
	    //    _object.mask_index = MY_MOCKED_COLLISION_MASK_UP_LEFT;
	    //    break;

	    //case MY_Direction.UP_RIGHT:
	    //    _object.image_angle = 45;
	    //    _object.mask_index = MY_MOCKED_COLLISION_MASK_UP_RIGHT;
	    //    break;

	    //case MY_Direction.DOWN_LEFT:
	    //    _object.image_angle = -135;
	    //    _object.mask_index = MY_MOCKED_COLLISION_MASK_DOWN_LEFT;
	    //    break;

	    //case MY_Direction.DOWN_RIGHT:
	    //    _object.image_angle = -45;
	    //    _object.mask_index = MY_MOCKED_COLLISION_MASK_DOWN_RIGHT;
	    //    break;

	    default:
			_object.mask_index = MY_MOCKED_COLLISION_MASK;
	        break;
	}
}