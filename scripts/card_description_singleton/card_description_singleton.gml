// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377

global.CONSTRUCTOR_PARAMS_SKILL_CARD = "CONSTRUCTOR_PARAMS_SKILL_CARD";
global.CONSTRUCTOR_PARAMS_SKILL_DESCRIPTION_CARD = "CONSTRUCTOR_PARAMS_SKILL_DESCRIPTION_CARD"

global.SINGLETON_DESCRIPTION_CARD = undefined;


function createDescriptionCard(_x, _y, _cardReference, _skillReference) {
	if(	global.SINGLETON_DESCRIPTION_CARD != undefined && 
		instance_exists(global.SINGLETON_DESCRIPTION_CARD)) {
		destoryDescriptionCard();
		//show_debug_message("destoryDescriptionCard")
	}
	
	var constrParams = [];
	constrParams[0] = _skillReference;
	add_params_byName_for_new_obj(global.CONSTRUCTOR_PARAMS_SKILL_DESCRIPTION_CARD, constrParams);
	
	global.SINGLETON_DESCRIPTION_CARD = instance_create_layer(
		_x,
		_y,
		global.LAYERS_PAUSE_GUI_DESCRIPTIONS, 
		obj_card_description
	)

	global.SINGLETON_DESCRIPTION_CARD.cardReference = _cardReference;
		//show_debug_message("zmieniam card reference" + string(global.SINGLETON_DESCRIPTION_CARD.cardReference) );
		
	global.SINGLETON_DESCRIPTION_CARD.image_xscale = 0.75;
	global.SINGLETON_DESCRIPTION_CARD.image_yscale = 0.75;
}

function destoryDescriptionCard() {
	if(global.SINGLETON_DESCRIPTION_CARD != undefined && instance_exists(global.SINGLETON_DESCRIPTION_CARD)) {
		with (global.SINGLETON_DESCRIPTION_CARD)
		{instance_destroy();}
		global.SINGLETON_DESCRIPTION_CARD = undefined;
	}
}