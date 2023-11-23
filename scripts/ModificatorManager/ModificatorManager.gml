

// PUBLIC
function add_new_Modifier(_modificator_class, _modificator_type) {
	
	// MUST BE MOVEABLE
	//var _speed_modifiers = get_speed_modifier(_modificator_class[global.MODIFICATOR_TARGET_KEY]);
	//var _speed_modifiers_number = ds_list_size(_speed_modifiers);
	
	switch(_modificator_type)
    {
        case ModificatorTypeMajor.MOVEMENT:
            add_speed_modifier(_modificator_class)
			break;
    }
	return 0;

}

function getNumberOfActiveModifiers(_obj) {
	var _speed_modifiers = get_speed_modifier(_obj);
	var _speed_modifiers_number = ds_map_size(_speed_modifiers);
	
	var _numberOfActiveModifiers = 0;
	
	_numberOfActiveModifiers += _speed_modifiers_number;
	
	return _numberOfActiveModifiers;
}



// PRIVATE
function add_speed_modifier(_modifier_class) {
	drawModificator(_modifier_class);
    _modifier_class[global.MODIFICATOR_TARGET_KEY].my_priv_speed_modifiers[? _modifier_class[global.MODIFICATOR_SKILL_NAME_ID_KEY]] = _modifier_class;
}





//function calculateSpeedSprite(_obj) {
//	var currentSpeed = my_get_speed(_obj);
//	if(currentSpeed == _obj.my_priv_base_speed) {
//		return;
//	}
	
//	if(currentSpeed <= 0.01) {
//		return ImmobizableModificatorSprite;
//	}
	
//	if(currentSpeed > _obj.my_priv_base_speed) {
//		return ImmobizableModificatorSprite;
//	} else {
//		return SlowModificatorSprite;
//	}
	
//}


//global.MODIFICATOR_KEY_MAJOR_TYPE = "major_type_key";
//global.MODIFICATOR_KEY_SUB_TYPE = "sub_type_key";
//global.MODIFICATOR_KEY_SKILL_ID = "skill_id_key";
//global.MODIFICATOR_KEY_DURATION_IN_FRAME_SPEED = "duration_in_room_speed_key";
//global.MODIFICATOR_KEY_INTERVAL_IN_FRAME_SPEED = "interval_in_frame_key";
//global.MODIFICATOR_PRIVATE_KEY_COUNTER = "priv_counter_key";


//function my_createModificatorStruct(
//	_skill_id_key, 
//	//_major_type, 
//	//_minor_type, 
//	_duration_in_sec,
//	_interval_in_sec,
//	_function_to_invoke)
//{
//	var _newModificator = {};
	
//	_newModificator[global.MODIFICATOR_KEY_SKILL_ID] = _skill_id_key
//	//_newModificator[global.MODIFICATOR_KEY_MAJOR_TYPE] = _major_type
//	//_newModificator[global.MODIFICATOR_KEY_SUB_TYPE] = _minor_type
//	_newModificator[global.MODIFICATOR_KEY_DURATION_IN_FRAME_SPEED] = _duration_in_sec * global.MY_ROOM_SPEED;
//	_newModificator[global.MODIFICATOR_KEY_INTERVAL_IN_FRAME_SPEED] = _interval_in_sec * global.MY_ROOM_SPEED;
	
//	_newModificator[global.MODIFICATOR_PRIVATE_KEY_COUNTER] = 0;
	
//	return _newModificator;
//}

//function my_INHERITENCE_skill_modificatorEffects(_obj)
//{
//	my_CONSTRUCTOR_default_skill_modificatorEffects_init(_obj);
//}

//function my_CONSTRUCTOR_default_skill_modificatorEffects_init(_instance) {
//    _instance.modificatorEffects_objects_list = ds_list_create();
//    _instance.hit_time_interval = 10;
//}

//function my_DESTRUCTOR_skill_modificatorEffects(_obj) {
//	ds_list_destroy(_obj.modificatorEffects_objects_list);
//}



////function my_SHOULD_PROCESS_ActionBasedOn_modificatorEffects(_skill_obj, _target_obj) {
////	if(object_is_in_hit_list(_skill_obj, _target_obj.id))
////		return false;
		
////	addModificatorsObject(_skill_obj, _target_obj);
////	return true;
////}


//function skillIsInModificatorList(_skill_obj, _target) {
//    for (var i = 0; i < ds_list_size(_target.modificatorEffects_objects_list); i++) {
//        var obj = _target.modificatorEffects_objects_list[| i];
//        if (obj[? global.MODIFICATOR_KEY_SKILL_ID] == _skill_obj.id) {
//            return true;
//        }
//    }
//    return false;
//}


//function addModificatorsSkillObject(_skill_obj, _target_obj) {
//    var _hit_obj = ds_map_create();
//    _hit_obj[? global.MODIFICATOR_KEY_SKILL_ID] = _skill_obj.id;
//    _hit_obj[? global.MODIFICATOR_KEY_DURATION_IN_SEC] = global.MY_ROOM_SPEED * _skill_obj.hit_time_interval;
    
//    ds_list_add(_skill_obj.modificatorEffects_objects_list, _hit_obj);
//}

//function my_PROCESS_modificatorsCleaner(_skill_obj) {
//	var _modifiers_to_invoke = ds_list_create();
	
//	for (var _i = 0; _i < ds_list_size(_skill_obj.modificatorEffects_objects_list); _i++) {
//	    var _hit_obj = _skill_obj.modificatorEffects_objects_list[| _i];
		
//		// maybe use separate method
//		if(_hit_obj[? global.MODIFICATOR_PRIVATE_KEY_INTERVAL_COUNTER] % 
//			_hit_obj[? global.MODIFICATOR_KEY_INTERVAL_IN_FRAME_SPEED] == 0) {
//			ds_list_add(_modifiers_to_invoke, element2);
//		}
		
//		_hit_obj[? global.MODIFICATOR_PRIVATE_KEY_INTERVAL_COUNTER]++;
			
    
//	    if (_hit_obj[? global.MODIFICATOR_PRIVATE_KEY_INTERVAL_COUNTER] >= _hit_obj[? global.MODIFICATOR_KEY_DURATION_IN_FRAME_SPEED]) {
//	        ds_list_delete(_skill_obj.modificatorEffects_objects_list, _i);
//	        _i--;
//	    }
//	}
//}

//function my_get_modificators_to_invoke(_skill_obj) {
//	for (var _i = 0; _i < ds_list_size(_skill_obj.modificatorEffects_objects_list); _i++) {
//	    var _hit_obj = _skill_obj.modificatorEffects_objects_list[| _i];
//	    _hit_obj[? global.MODIFICATOR_PRIVATE_KEY_INTERVAL_COUNTER]++;
    
//	    if (_hit_obj[? global.MODIFICATOR_PRIVATE_KEY_INTERVAL_COUNTER] >= _hit_obj[? global.MODIFICATOR_KEY_DURATION_IN_FRAME_SPEED]) {
//	        ds_list_delete(_skill_obj.modificatorEffects_objects_list, _i);
//	        _i--;
//	    }
//	}
//}



//function my_PROCESS_modificatiors_PER_frame(_skill_obj) {
//	var _effects_to_invoke = 
//	my_PROCESS_modificatorsCleaner(_skill_obj);
//}

