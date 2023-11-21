
function my_DEFAULT_simple_push_action(_skill_action_obj) {
	var _action_to_run = function(_skill_action_obj_param, _target_object) {
		var _direction = point_direction(_skill_action_obj_param.x, 
										 _skill_action_obj_param.y, 
										 _target_object.x, 
										 _target_object.y);
		add_speed_modifier(_target_object, "test", 0, 3);
		//var force = 3;
		//_target_object.speed = force;
	}
	
	
	var _skill_action_struct = my_createSkillAction(SKILL_PHASE.PUSH, _action_to_run, 0);
	
	my_addSkillAction(_skill_action_obj.my_skill_execution_sequence, _skill_action_struct);
}