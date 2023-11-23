global.MODIFIERS_LAYER = "Modifiers";


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


function drawModificator(_modificator) {
	//show_debug_message("drawModificator2 wywołana: " + string(current_time));

	var mod_instance = instance_create_layer(0, 0, global.MODIFIERS_LAYER, abstr_modificator_icon);
	mod_instance.sprite_index = _modificator[global.MODIFICATOR_SPRITE_KEY];
	mod_instance.image_index = 0;
	mod_instance.depth = -100; // Ustawienie obiektu na wierzchu innych
	mod_instance.modificator = _modificator;
}

function calculateSpeedSprite(_obj) {
	var currentSpeed = my_get_speed(_obj);
	if(currentSpeed == _obj.my_priv_base_speed) {
		return;
	}
	
	if(currentSpeed <= 0.01) {
		return ImmobizableModificatorSprite;
	}
	
	if(currentSpeed > _obj.my_priv_base_speed) {
		return ImmobizableModificatorSprite;
	} else {
		return SlowModificatorSprite;
	}
}
