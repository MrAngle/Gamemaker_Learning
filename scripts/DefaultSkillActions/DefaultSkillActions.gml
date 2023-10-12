// // Script assets have changed for v2.3.0 see
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function my_DEFAULT_TARGET_REACT_ANIMATION(_skill_action_obj) {
	var _action_to_run = function(_skill_action_obj_param, _target_object) {
		_target_object.my_hit_animation_duration_counter = _target_object.my_hit_animation_duration;
	}
	
	var _skill_action_struct = my_createSkillAction(SKILL_PHASE.TARGET_REACT_ANIMATION, _action_to_run, 0);
	
	my_addSkillAction(_skill_action_obj.my_skill_execution_sequence, _skill_action_struct);
}

function my_DEFAULT_check_if_dead(_skill_action_obj) {
	var _action_to_run = function(_skill_action_obj_param, _target_object) {
		if(_skill_action_obj_param.damage_dealt > 0) {
			my_check_if_dead(_target_object);
		}
	}
	
	var _skill_action_struct = my_createSkillAction(SKILL_PHASE.SUM_UP_TARGET_STATE, _action_to_run, 0);
	
	my_addSkillAction(_skill_action_obj.my_skill_execution_sequence, _skill_action_struct);
}


function my_DEFAULT_damage_numbers(_skill_action_obj) {
	var _action_to_run = function(_skill_action_obj_param, _target_object) {
		var _damage = _skill_action_obj_param.damage_dealt_per_activation;
		var _damage_text = instance_create_layer(_target_object.x, 
			_target_object.y - sprite_height / 2, "DamageTextLayer", obj_damage_text);
			_damage_text.depth = -999999;
		_damage_text.damage = _damage;
	}
	
	var _skill_action_struct = my_createSkillAction(SKILL_PHASE.COMPLETION, _action_to_run, 0);
	
	my_addSkillAction(_skill_action_obj.my_skill_execution_sequence, _skill_action_struct);
}


function my_DEFAULT_simple_damage_action(_skill_action_obj) {
	var _action_to_run = function(_skill_action_obj_param, _target_object) {
		var _damage = my_calculate_damage(_skill_action_obj_param);
		
		return _target_object.my_RECEIVE_DAMAGE_function(_target_object, _skill_action_obj_param, _damage);
	}
	
	var _skill_action_struct = my_createSkillAction(SKILL_PHASE.DAMAGE, _action_to_run, 0);
	
	my_addSkillAction(_skill_action_obj.my_skill_execution_sequence, _skill_action_struct);
}