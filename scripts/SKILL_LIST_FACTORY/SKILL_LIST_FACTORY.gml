// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377


function FIREBALL_ATTACK_1_action(_skill_action_obj) {
	var _action_to_run = function(_skill_action_obj_param, _target_object) {
		var _damage = my_calculate_damage(_skill_action_obj_param);
		var _modificator = MODIFICATOR_FIRE_DOT_1_returnMODIFICATOR(_target_object, _skill_action_obj_param);
		add_new_Modifier(_modificator);
		
		return _target_object.my_RECEIVE_DAMAGE_function(_target_object, _skill_action_obj_param, _damage);
	}
	
	var _skill_action_struct = my_createSkillAction(SKILL_PHASE.DAMAGE, _action_to_run, 0);
	
	my_addSkillAction(_skill_action_obj.my_skill_execution_sequence, _skill_action_struct);
}

function LIFE_WALL_ATTACK_1_action(_skill_action_obj) {
	var _action_to_run = function(_skill_action_obj_param, _target_object) {
		var _damage = my_calculate_damage(_skill_action_obj_param);
		
		return _target_object.my_RECEIVE_DAMAGE_function(_target_object, _skill_action_obj_param, _damage);
	}
	
	var _skill_action_struct = my_createSkillAction(SKILL_PHASE.DAMAGE, _action_to_run, 0);
	
	my_addSkillAction(_skill_action_obj.my_skill_execution_sequence, _skill_action_struct);
}