
global.CONSTRUCTOR_PARAM_MODIFIERS = "CONSTRUCTOR_PARAM_MODIFIERS";


function my_INHERITENCE_modificator_draw_manager(_obj)
{
	_init_draw_manager(_obj);
}

function _init_draw_manager(_obj)
{
	my_CONSTRUCTOR_default_modificator_draw_manager_init(_obj)
}

function my_CONSTRUCTOR_default_modificator_draw_manager_init(_instance) {
    _instance.modifiers_map = ds_map_create();
}

function my_DESTRUCTOR_default_modificator_draw_manager_init(_instance) {
    ds_list_destroy(_instance.modifiers_list);
}


function drawModificator_returnModificatorObject(_modificator) {
	//show_debug_message("drawModificator2 wywołana: " + string(current_time));
	
	var constructorParam = [];
	 constructorParam[0] = _modificator;

	add_params_byName_for_new_obj(global.CONSTRUCTOR_PARAM_MODIFIERS, constructorParam);

	var _mod_instance;
	if(obj_is_player(_modificator[global.MODIFICATOR_TARGET_KEY])) {
		_mod_instance = instance_create_layer(0, 0, global.LAYERS_MODIFIERS, obj_modificator_player);
	} else {
		_mod_instance = instance_create_layer(0, 0, global.LAYERS_MODIFIERS, obj_modificator_enemy);
	}

	_mod_instance.sprite_index = _modificator[global.MODIFICATOR_SPRITE_KEY];
	_mod_instance.image_index = 0;
	_mod_instance.depth = -100; // Ustawienie obiektu na wierzchu innych

	return _mod_instance;
}

