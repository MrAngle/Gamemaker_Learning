
function my_DEFAULT_simple_push_action(_skill_action_obj) {
	var _action_to_run = function(_skill_action_obj_param, _target_object) {
		var _direction = point_direction(_skill_action_obj_param.x, 
										 _skill_action_obj_param.y, 
										 _target_object.x, 
										 _target_object.y);
										 
		var _modificator = MODIFICATOR_WIND_1_returnMODIFICATOR(_target_object, _skill_action_obj_param);
										 
		//var _modificator = MoveTimeModifier(
		//    _target_object,             // Obiekt, który zostanie zmodyfikowany.
		//    _skill_action_obj_param,             // Obiekt źródłowy wywołujący modyfikację.
		//    SlowModificatorSprite,             // Sprite, który ma być wyświetlany jako ikona efektu.
		//    MY_SKILL_LIST.WIND_1,    // Enum reprezentujący umiejętność lub efekt.
		//    3,    // Czas trwania efektu w sekundach.
		//    global.MY_EMPTY_FUNCTION_WITH_2_PARAMS,      // Funkcja, która zostanie wywołana (może być pusta).
		//    0.1,				// Wartość modyfikatora, np. zmiana prędkości.
		//    false                // Boolowska wartość określająca, czy efekt można skumulować.
		//);			
		
		add_new_Modifier(_modificator);
										 
		//MoveTimeModifier(_target, _source, _sprite, _skill_name_enum, _duration_in_sec, _emptyFunction, _value, false);
		//add_speed_modifier(_target_object, _skill_action_obj_param, SlowModificatorSprite, MY_SKILL_LIST.WIND_1, _skill_action_obj_param.id, 0.1, 3);
	}
	//show_debug_message("my_DEFAULT_simple_push_action wywołana: " + string(current_time));

	
	var _skill_action_struct = my_createSkillAction(SKILL_PHASE.PUSH, _action_to_run, 0);
	
	my_addSkillAction(_skill_action_obj.my_skill_execution_sequence, _skill_action_struct);
}