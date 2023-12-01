// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377

global.SKILL_CONSTRUCTOR_PARAMS = "SKILL_CONSTRUCTOR_PARAMS"

function my_INHERITENCE_skill(_obj)
{
	//var objectName = object_get_name(_obj);
	var _received_params = get_params_from_global_map(object_index);

	if (is_undefined(_received_params)) {
	    _received_params = {};
	}

	_initSkill(_obj, _received_params);
}


function _initSkill(_obj, _param_received_params)
{
	my_CONSTRUCTOR_default_skill_init(_obj)
	if(my_object_has_field(_obj, "my_object_skill_init_function") && 
		!is_undefined(_obj.my_object_skill_init_function)) {
		_obj.my_object_skill_init_function(_obj);
	}
	
	my_assign_skill_global_param(_obj, _param_received_params);
}

function my_assign_skill_global_param(_object_skill, _global_param_skill) {
    if (_global_param_skill == undefined) return;

	//show_debug_message("ustawiam my_assign_skill_global_param")
	//show_debug_message(string(_global_param_skill))

    if (variable_struct_exists(_global_param_skill, "my_skill_type"))
        _object_skill.my_skill_type = _global_param_skill.my_skill_type;
    if (variable_struct_exists(_global_param_skill, "my_skill_effects_function"))
		_object_skill.my_skill_effects_function = _global_param_skill.my_skill_effects_function;
    if (variable_struct_exists(_global_param_skill, "my_skill_name"))
		_object_skill.my_skill_name = _global_param_skill.my_skill_name;
    if (variable_struct_exists(_global_param_skill, "my_skill_description"))
		_object_skill.my_skill_description = _global_param_skill.my_skill_description;
	if (variable_struct_exists(_global_param_skill, "my_priv_create_in_description_mode"))
		_object_skill.my_priv_create_in_description_mode = _global_param_skill.my_priv_create_in_description_mode;
	if (variable_struct_exists(_global_param_skill, "my_invoker"))
		_object_skill.my_invoker = _global_param_skill.my_invoker;
}

function my_CONSTRUCTOR_default_skill_init(_instance) {
    _instance.my_skill_type = [MY_SKILL_TYPE.PHYSICAL];
    _instance.my_skill_effects_function = function(_affected_object) {};
    _instance.my_skill_name = MY_SKILL_LIST.NOT_DEFINED;
    _instance.my_skill_description = "Description";
    _instance.my_priv_create_in_description_mode = false;
    _instance.my_invoker = undefined;
    _instance.my_invoker_not_hittable_counter = 2 * global.MY_ROOM_SPEED;
}

function my_AddSkillType(instance, skillType) {
    var currentIndex = array_length(instance.my_skill_type);
    instance.my_skill_type[currentIndex] = skillType;
}