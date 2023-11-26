global.PLAYER_MODIFICATORS_OBJECTS_LIST = ds_list_create();

global.BASE_GUI_X_POSITION = 0;
global.MODIFIER_SPACING = 15;

// PUBLIC
function processAllModifiersPerFrame(_obj) {
	var _allModifiers = getArrayOfAllModifiers_returnArray(_obj);
	
	for (var i = 0; i < array_length(_allModifiers); i++) {
	    var _currentModifiersMap = _allModifiers[i];
	    private_processModifiersPerFrame(_currentModifiersMap);
	}
}

// PRIVATE
function private_processModifiersPerFrame(_modifiers) {

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
			case MODIFIER_CLASS_TYPE.TIME_DAMAGE:
		       _shouldDelete = processTimeModifierPerFrame_returnShouldDelete(_modifier_class, _modifiers);
		        break;
		    case MODIFIER_CLASS_TYPE.AURA_MOVEMENT:
		        processAuraModifiersPerFrame(_modifier_class, _modifiers);
		        break;
		    default:
		        break;
		}
		
		if(_shouldDelete) {
			if(_modifier_class[global.MODIFICATOR_STACK_NUMBER_KEY] <= 1) {
				ds_map_delete(_modifiers, _key);
			} else {
				removeStack(_modifier_class);
			}
		}
	}
}

function removeStack(_modifier_class) {
	_modifier_class[global.MODIFICATOR_STACK_NUMBER_KEY] -= 1;
	_modifier_class[global.MODIFICATOR_ON_RESET_FUNCTION_KEY](_modifier_class);
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



//function processTimeModifiersPerFrame(_modifiers) {
//    if (is_undefined(_modifiers) || 
//		!ds_exists(_modifiers, ds_type_map) ||
//		ds_map_size(_modifiers) < 1) {
//        // Debug message
//        //show_debug_message("Mapa modyfikatorów prędkości nie istnieje lub nie jest zainicjowana.");
//        //// Jeśli nie istnieje, wyjdź z funkcji
//        return;
//    }
	
//    for (var k = ds_map_find_first(_modifiers); !is_undefined(k); k = ds_map_find_next(_modifiers, k)) {
//		var _modifier = _modifiers[? k];
//        var _key = k;
		
//		var _shouldDelete = processTimeModifierPerFrame2_returnShouldDelete(_modifier, _modifiers)
		
//		if(_shouldDelete) {
//			ds_map_delete(_modifiers, _key);
//		}
//    }
//}


// PUBLIC
function add_new_Modifier(_modificator_class) {
	
	var foundModificatorToStack = false;

	
	if(isMOVEMENTClassType(_modificator_class[global.MODIFICATOR_CLASS_TYPE_KEY])) {
		add_speed_modifier(_modificator_class)
		return true;
	} else {
		
	if(isMOVEMENTClassType(_modificator_class[global.MODIFICATOR_CLASS_TYPE_KEY])) {
	}
		priv_add_modifier(_modificator_class);
	//if(isMOVEMENTClassType(_modificator_class[global.MODIFICATOR_CLASS_TYPE_KEY])) {
		// to add
	}
	
	show_debug_message("SHould add modifier, but not found: " + string(id) + " FOR: " + string(_modificator_class));
	return false;
}

// PRIVATE
function priv_add_modifier(_modifier_class) {
	
	var _target = _modifier_class[global.MODIFICATOR_TARGET_KEY];
	
	var _foundModificatorToStack = addStack_handleStackableModifier_isFoundModifier(
		_target.get_dot_modifier(_target), 
		_modifier_class
	)
	
	if(_foundModificatorToStack) {
		show_debug_message("STACK  modifier, but not found: " + string(_modifier_class[global.MODIFICATOR_STACK_NUMBER_KEY]));
		return;
	}
	
	var _modifier_obj = drawModificator_returnModificatorObject(_modifier_class);
	
	if(obj_is_player(_modifier_class[global.MODIFICATOR_TARGET_KEY])) {
		ds_list_add(global.PLAYER_MODIFICATORS_OBJECTS_LIST, _modifier_obj);
	}
	_target.set_dot_modifier(_target, _modifier_class);

	update_modifier_position(_target);
}

// PRIVATE
function add_speed_modifier(_modifier_class) {
	
	var _foundModificatorToStack = addStack_handleStackableModifier_isFoundModifier(
		get_speed_modifier(_modifier_class[global.MODIFICATOR_TARGET_KEY]), 
		_modifier_class
	)
	
	if(_foundModificatorToStack) {
		show_debug_message("STACK  modifier, but not found: " + string(_modifier_class[global.MODIFICATOR_STACK_NUMBER_KEY]));
		return;
	}
	
	var _modifier_obj = drawModificator_returnModificatorObject(_modifier_class);
	
	if(obj_is_player(_modifier_class[global.MODIFICATOR_TARGET_KEY])) {
		ds_list_add(global.PLAYER_MODIFICATORS_OBJECTS_LIST, _modifier_obj);
	}
	
    _modifier_class[global.MODIFICATOR_TARGET_KEY].my_priv_speed_modifiers[? _modifier_class[global.MODIFICATOR_SKILL_NAME_ID_KEY]] = _modifier_class;
	
	update_modifier_position(_modifier_class[global.MODIFICATOR_TARGET_KEY]);
}


// PUBLIC
function remove_ModifierBySkillListEnum(_obj, _skillList_enum) {

	var _allModifiers = getArrayOfAllModifiers_returnArray(_obj);
	
	for (var i = 0; i < array_length(_allModifiers); i++) {
	    var _currentModifiersMap = _allModifiers[i];
	    var isRemoved = remove_ModifierByEnum_returnIsRemoved(_currentModifiersMap, _skillList_enum);
		
		if(isRemoved) {
			return;
		}
	}

}

// PRIVATE
function remove_ModifierByEnum_returnIsRemoved(_modifierMap, _skillList_enum) {
	if (ds_map_exists(_modifierMap, _skillList_enum)) {
		var _modifier = ds_map_find_value(_modifierMap, _skillList_enum);
		_modifier[global.MODIFICATOR_IS_DELETED_KEY] = true;
		
	    ds_map_delete(_modifierMap, _skillList_enum);
		return true;
	}

	show_debug_message("SHould remove, but not found: " + string(id) + " FOR: " + string(_skillList_enum));
	return false;
}

function addStack_handleStackableModifier_isFoundModifier(_modifierMap, _modifierClass) {
	
	if(!_modifierClass[global.MODIFICATOR_IS_STACKABLE_KEY]) {
		return false;
	}
	
	if (ds_map_exists(_modifierMap, _modifierClass[global.MODIFICATOR_SKILL_NAME_ID_KEY])) {
		var _existedModifier = ds_map_find_value(_modifierMap, _modifierClass[global.MODIFICATOR_SKILL_NAME_ID_KEY]);

		_existedModifier[global.MODIFICATOR_STACK_NUMBER_KEY] += _modifierClass[global.MODIFICATOR_STACK_NUMBER_KEY];

		return true;
	}
	return false;
}

function getArrayOfAllModifiers_returnArray(_obj) {
	var _arrayOfAllModifiers = [];
	
	_arrayOfAllModifiers[0] = get_speed_modifier(_obj);
	_arrayOfAllModifiers[1] = _obj.get_dot_modifier(_obj);
	
	return _arrayOfAllModifiers;
}

function getNumberOfActiveModifiers(_obj) {
	var _speed_modifiers = get_speed_modifier(_obj);
	var _speed_modifiers_number = ds_map_size(_speed_modifiers);
	
	var _numberOfActiveModifiers = 0;
	
	_numberOfActiveModifiers += _speed_modifiers_number;
	
	return _numberOfActiveModifiers;
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
