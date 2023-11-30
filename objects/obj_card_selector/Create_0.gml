// Pobierz pozycję kamery

cardsNumbers = 8;

heightCard = (329/2) * getZoomFactor();
widthCard = (245/2) * getZoomFactor();
//widthCard = 100;

cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);

// Pobierz wysokość widoku kamery
view_height = camera_get_view_height(view_camera[0]);
view_width = camera_get_view_width(view_camera[0]);

widthPerCard = ((view_width - widthCard) / (cardsNumbers));
//if(widthPerCard < widthCard) {
//	widthPerCard = widthPerCard - (widthCard - widthPerCard)
//}

card = [];

for(var i= 0; i < cardsNumbers; i++) {
	// Utwórz obiekt w lewym dolnym rogu widoku kamery
	// Zakładając, że punkt początkowy sprite'a obiektu card jest w lewym górnym rogu:
	
	card_x = (i * widthPerCard); // + (i * widthOffSet);
	
	
	var _skillRef = obj_fireball_attack_1;
	if(i % 2 == 0) {
		_skillRef = obj_fireball_attack_1;
	} else {
		_skillRef = obj_lighting_attack_1;
	}
	
	//var skillToCreate = obj_fireball_attack_1;
	var customConstructorParams = {
		my_priv_create_in_description_mode: true
	};
	add_params_byName_for_new_obj(_skillRef, customConstructorParams);
	var _skillObjReference = instance_create_layer(-999999, -999999, global.LAYERS_INVISIBLE, _skillRef);
	
	
	var constrParams = [];
	constrParams[0] = _skillObjReference;
	constrParams[1] = _skillRef;
	add_params_byName_for_new_obj(global.CONSTRUCTOR_PARAMS_SKILL_CARD, constrParams);
	
	card[i] = instance_create_layer(cam_x + card_x, cam_y + view_height - heightCard, global.LAYERS_PAUSE_GUI, obj_skill_card);
	if(i % 2 == 0) {
		card[i].sprite_index = sprite_card_fireball_1;
	} else {
		card[i].sprite_index = sprite_card_lighting_1;
	}
	
	card[i].image_xscale = 0.50;
	card[i].image_yscale = 0.50;
	card[i].scale = 0.50;
	scaleObjectBasedOnGlobalSettings(card[i]);
	card[i].depth -= 10;
	card[i].activeWidth = widthPerCard;
}

