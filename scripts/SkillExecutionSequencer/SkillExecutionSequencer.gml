
// REMEMBER TO DESTROY LIST!
function my_INHERITENCE_skill_sequencer(_obj)
{
	var _received_params = get_params_from_global_map(_obj.object_index);

	if (is_undefined(_received_params)) {
	    _received_params = {};
	}

	_initskill_sequencer(_obj, _received_params);
}


function my_DESTRUCTOR_skill_sequencer(_obj) {
	ds_list_destroy(_obj.my_skill_execution_sequence);
}

function _initskill_sequencer(_obj, _param_received_params)
{
	my_CONSTRUCTOR_default_skill_sequencer_init(_obj)
	if(my_object_has_field(_obj, "my_object_skill_sequencer_init_function") && 
		!is_undefined(_obj.my_object_skill_sequencer_init_function)) {
		_obj.my_object_skill_sequencer_init_function(_obj);
	}
	
	my_assign_skill_sequencer_global_param(_obj, _param_received_params);
}

function my_assign_skill_sequencer_global_param(_object_skill_sequencer, _global_param_skill_sequencer) {
    if (_global_param_skill_sequencer == undefined) return;

    if (variable_struct_exists(_global_param_skill_sequencer, "my_skill_execution_sequence"))
		_object_skill_sequencer.my_skill_execution_sequence = _global_param_skill_sequencer.my_skill_execution_sequence;

}

function my_CONSTRUCTOR_default_skill_sequencer_init(_instance) {
    _instance.my_skill_execution_sequence = ds_list_create(); // array of SkillActions
    _instance.damage_dealt = 0; // sum
    _instance.damage_dealt_per_activation = 0; // sum
}



function my_ExecuteAllSkillActions(_skill_obj, _target_obj) {
    //my_SortSkillList(_skill_obj.my_skill_execution_sequence);
	
	
    
    var size = ds_list_size(_skill_obj.my_skill_execution_sequence);
    for (var i = 0; i < size; i++) {
        var _skill_action_struct = _skill_obj.my_skill_execution_sequence[| i];
		
		my_ManageSkillAction(_skill_obj, _target_obj, _skill_action_struct)
    }
	
	_skill_obj.damage_dealt += _skill_obj.damage_dealt_per_activation;
	_skill_obj.damage_dealt_per_activation = 0;
	
	//ds_list_clear(_skill_obj.my_skill_execution_sequence);
}


