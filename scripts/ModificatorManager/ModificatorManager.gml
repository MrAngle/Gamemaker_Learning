global.PLAYER_MODIFICATORS_OBJECTS_LIST = ds_list_create();

global.BASE_GUI_X_POSITION = 0;
global.MODIFIER_SPACING = 15;

// PUBLIC
function processAllModifiersPerFrame(_obj) {
	var _allModifiers = getArrayOfAllModifiers_returnArray(_obj);
	
	for (var i = 0; i < array_length(_allModifiers); i++) {
	    var _currentModifiersMap = _allModifiers[i];
	    private_processModifiersPerFrame(_obj, _currentModifiersMap);
	}
}

// PRIVATE
function private_processModifiersPerFrame(_obj, _modifiers) {

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
				show_debug_message("typ to: " + myModifierClassType + " dla: " + _modifier_class)
		        break;
		}
		
		if(_shouldDelete) {
			if(_modifier_class[global.MODIFICATOR_STACK_NUMBER_KEY] <= 1) {
				ds_map_delete(_modifiers, _key);
			} else {
				removeStack(_modifier_class);
			}
			calculateAfterRemove(_obj);
		}
	}
}

function calculateAfterRemove(_obj) {
	my_calculate_speed(_obj);
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

// PUBLIC
function add_new_Modifier(_modificator_class) {
	
	var foundModificatorToStack = false;
	
	var _modificatorClassType = _modificator_class[global.MODIFICATOR_CLASS_TYPE_KEY];

	
	if(isMOVEMENTClassType(_modificatorClassType)) {
		add_speed_modifier(_modificator_class)
	} else {
	if(isDOTClassType(_modificatorClassType)) {
	}
		priv_add_modifier(_modificator_class);
	}
		
	priv_update_modifier_position(_modificator_class[global.MODIFICATOR_TARGET_KEY]);
}

// PRIVATE
function priv_add_modifier(_modifier_class) {
	
	var _target = _modifier_class[global.MODIFICATOR_TARGET_KEY];
	
	if(shoudStackModificators_returnFound(
		_target.get_dot_modifier(_target),
		_modifier_class
	)) {
		// skip method
		return;
	}
	
	var _modifier_obj = drawModificator_returnModificatorObject(_modifier_class);
	
	if(obj_is_player(_target)) {
		ds_list_add(global.PLAYER_MODIFICATORS_OBJECTS_LIST, _modifier_obj);
	}
	_target.set_dot_modifier(_target, _modifier_class);

	priv_update_modifier_position(_target);
}

// PRIVATE
function add_speed_modifier(_modifier_class) {
	
	var _target = _modifier_class[global.MODIFICATOR_TARGET_KEY];
	
	if(shoudStackModificators_returnFound(
		get_speed_modifier(_target),
		_modifier_class
	)) {
		// skip method
		return;
	}
	
	var _modifier_obj = drawModificator_returnModificatorObject(_modifier_class);
	
	if(obj_is_player(_target)) {
		ds_list_add(global.PLAYER_MODIFICATORS_OBJECTS_LIST, _modifier_obj);
	}
	
	PUBLIC_add_speed_modifier(_target, _modifier_class);
	
    //_target.my_priv_speed_modifiers[? _modifier_class[global.MODIFICATOR_SKILL_NAME_ID_KEY]] = 
	//	_modifier_class;

}

// PRIVATE
function shoudStackModificators_returnFound(_modifiersToCheck, _modifier_class) {
	var _foundModificatorToStack = addStack_handleStackableModifier_isFoundModifier(
		_modifiersToCheck, 
		_modifier_class
	)
	
	if(_foundModificatorToStack) {
		show_debug_message("STACK  modifier, but not found: " + string(_modifier_class[global.MODIFICATOR_STACK_NUMBER_KEY]));
		return true;
	}
	return false;
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

//function getNumberOfActiveModifiers(_obj) {
//	var _speed_modifiers = get_speed_modifier(_obj);
//	var _speed_modifiers_number = ds_map_size(_speed_modifiers);
	
//	var _numberOfActiveModifiers = 0;
	
//	_numberOfActiveModifiers += _speed_modifiers_number;
	
//	return _numberOfActiveModifiers;
//}

function update_modifier_position(_target_obj) {
	var _is_player = obj_is_player(_target_obj);
	
	if (_is_player) {
	    priv_update_modifier_position(_target_obj);
	} else {
		priv_update_modifier_position(_target_obj);
		// TODO
	    // Instancja nie znajduje się w tablicy
	}
}

function priv_update_modifier_position(_obj) {
	var _allModifiers = getArrayOfAllModifiers_returnArray(_obj);
	var _modifiersCounter = 0;
	
	for (var i = 0; i < array_length(_allModifiers); i++) {
	    var _currentModifiersMap = _allModifiers[i];
	    _modifiersCounter = update_modifiers_position_returnNumerOfModifiers(_currentModifiersMap, _modifiersCounter);
	}
}

function update_modifiers_position_returnNumerOfModifiers(_collectionToCheck_map, _currentNumberOfModifiers) {
	var _numberOfModifiers = _currentNumberOfModifiers;
	var size = ds_map_size(_collectionToCheck_map);
	
	var key = ds_map_find_first(_collectionToCheck_map);
	while (key != undefined) {
	    var value = ds_map_find_value(_collectionToCheck_map, key);
		
		if (value == undefined || (is_array(value) && array_length(value) == 0)) {
		    ds_map_delete(_collectionToCheck_map, value);
		} else {
			
			var _is_player = obj_is_player(value[global.MODIFICATOR_TARGET_KEY]);
	
			if (_is_player) {
				// use in gui
				value[global.MODIFICATOR_OBJECT_REFERENCE_KEY].x_offset = 
					(_numberOfModifiers * 64);
			} else {
				value[global.MODIFICATOR_OBJECT_REFERENCE_KEY].x_offset = 
					(_numberOfModifiers * 32)
			}
			_numberOfModifiers += 1;
		}
	    key = ds_map_find_next(_collectionToCheck_map, key);
	}
	return _numberOfModifiers;
}
