global.PLAYER_MODIFICATORS_OBJECTS_LIST = ds_list_create();

global.BASE_GUI_X_POSITION = 0;
global.MODIFIER_SPACING = 15;

function processAllModifiersPerFrame(_obj) {
	var _speed_modifiers = get_speed_modifier(_obj);
	
	processModifiersPerFrame(_speed_modifiers);
}

function processModifiersPerFrame(_modifiers) {

	var _shouldDelete = false;
	for (var k = ds_map_find_first(_modifiers); !is_undefined(k); k = ds_map_find_next(_modifiers, k)) {
		var _modifier_class = _modifiers[? k];
        var _key = k;
		
		var myModifierClassType = _modifier_class[global.MODIFICATOR_CLASS_TYPE_KEY];
		switch (myModifierClassType) {
		    case MODIFIER_CLASS_TYPE.BASE:
		        break;
		    case MODIFIER_CLASS_TYPE.TIME:
		        _shouldDelete = processTimeModifierPerFrame_returnShouldDelete(_modifier_class, _modifiers);
		        break;
		    case MODIFIER_CLASS_TYPE.AURA:
				processAuraModifiersPerFrame(_modifier_class, _modifiers);
		        break;
		    case MODIFIER_CLASS_TYPE.TIME_MOVEMENT:
		       _shouldDelete = processTimeModifierPerFrame_returnShouldDelete(_modifier_class, _modifiers);
		        break;
		    case MODIFIER_CLASS_TYPE.AURA_MOVEMENT:
		        processAuraModifiersPerFrame(_modifier_class, _modifiers);
		        break;
		    default:
		        // Kod, który zostanie wykonany, jeśli żaden z przypadków nie pasuje
		        break;
		}
		
		if(_shouldDelete) {
			ds_map_delete(_modifiers, _key);
		}
	}
}





function processTimeModifierPerFrame(_modifier) {
	_modifier[global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY] -= 1;
}

function processTimeModifierPerFrame_returnShouldDelete(_modifier_class, _modifiers_map) {
	_modifier_class[global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY] -= 1;
	
    // Sprawdź, czy czas trwania modyfikatora dobiegł końca
    if (_modifier_class[global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY] <= 0) {
        // Dodaj klucz do listy kluczy do usunięcia
		_modifier_class[global.MODIFICATOR_ON_DELETE_KEY](	_modifier_class[global.MODIFICATOR_TARGET_KEY], 
															_modifier_class[global.MODIFICATOR_SOURCE_KEY]);
		
		return true;
    }
	return false;
}

function processAuraModifierPerFrame(_modifier, _modifiers) {
}

function processAuraModifiersPerFrame(_modifier, _modifiers) {
}



function processTimeModifiersPerFrame(_modifiers) {
    if (is_undefined(_modifiers) || 
		!ds_exists(_modifiers, ds_type_map) ||
		ds_map_size(_modifiers) < 1) {
        // Debug message
        //show_debug_message("Mapa modyfikatorów prędkości nie istnieje lub nie jest zainicjowana.");
        //// Jeśli nie istnieje, wyjdź z funkcji
        return;
    }
	
    for (var k = ds_map_find_first(_modifiers); !is_undefined(k); k = ds_map_find_next(_modifiers, k)) {
		var _modifier = _modifiers[? k];
        var _key = k;
		
		var _shouldDelete = processTimeModifierPerFrame2_returnShouldDelete(_modifier, _modifiers)
		
		if(_shouldDelete) {
			ds_map_delete(_modifiers, _key);
		}
    }
}

//function processTimeModifiersPerFrame(_modifiers) {
//    if (is_undefined(_modifiers) || 
//		!ds_exists(_modifiers, ds_type_map) ||
//		ds_map_size(_modifiers) < 1) {
//        // Debug message
//        //show_debug_message("Mapa modyfikatorów prędkości nie istnieje lub nie jest zainicjowana.");
//        //// Jeśli nie istnieje, wyjdź z funkcji
//        return;
//    }

//    // Lista kluczy do usunięcia po iteracji
//    var _keys_to_remove = ds_list_create();
	
//    for (var k = ds_map_find_first(_modifiers); !is_undefined(k); k = ds_map_find_next(_modifiers, k)) {
//		var _modifier = _modifiers[? k];
//        var _key = k;
		
//		if(isAuraClassType(_modifier[global.MODIFICATOR_CLASS_TYPE_KEY])) {
//			continue;
//		}
        
//        // Zaktualizuj czas trwania modyfikatora
//        processTimeModifierPerFrame(_modifier)

//        // Sprawdź, czy czas trwania modyfikatora dobiegł końca
//        if (_modifier[global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY] <= 0) {
//            // Dodaj klucz do listy kluczy do usunięcia
//			_modifier[global.MODIFICATOR_ON_DELETE_KEY](_modifier[global.MODIFICATOR_TARGET_KEY], 
//												_modifier[global.MODIFICATOR_SOURCE_KEY]);
//			ds_list_add(_keys_to_remove, _key);
//        }
//    }

//    // Usuń modyfikatory, których czas trwania się zakończył
//    for (var i = 0; i < ds_list_size(_keys_to_remove); i++) {
//        var _key = ds_list_find_value(_keys_to_remove, i);
		
//        ds_map_delete(_modifiers, _key);
//    }

//    // Zwolnij pamięć
//    ds_list_destroy(_keys_to_remove);
//}


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
	var _modifier_obj = drawModificator_returnModificatorObject(_modifier_class);
	
	ds_list_add(global.PLAYER_MODIFICATORS_OBJECTS_LIST, _modifier_obj);
    _modifier_class[global.MODIFICATOR_TARGET_KEY].my_priv_speed_modifiers[? _modifier_class[global.MODIFICATOR_SKILL_NAME_ID_KEY]] = _modifier_class;
	
	update_modifier_position(_modifier_class[global.MODIFICATOR_TARGET_KEY]);
}

function update_modifier_position(_target_obj) {
	var _is_player = obj_is_player(_target_obj);
	
	if (_is_player) {
	    update_PLAYER_modifier_position();
	} else {
		// TODO
	    // Instancja nie znajduje się w tablicy
	}
}




function update_PLAYER_modifier_position() {
	var size = ds_list_size(global.PLAYER_MODIFICATORS_OBJECTS_LIST);
	
	var _numberOfModifiers = 0;
	for(var _index = 0; _index < size; _index++)
	{
	    var _item = ds_list_find_value(global.PLAYER_MODIFICATORS_OBJECTS_LIST, _index);
		
		if (!instance_exists(_item)) {
			ds_list_delete(global.PLAYER_MODIFICATORS_OBJECTS_LIST, _index);
			_numberOfModifiers -= 1;
			//_index -= 1;
	    } else {
			_item.x = global.BASE_GUI_X_POSITION + (_numberOfModifiers * 64) + (_numberOfModifiers * global.MODIFIER_SPACING)
		}
		
		_numberOfModifiers += 1;
	}
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

