// Pobierz pozycję kamery
widthOffSet = 10;

cardsNumbers = 8;

heightCard = 329;
widthCard = 245;
//widthCard = 100;



cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);



// Pobierz wysokość widoku kamery
view_height = camera_get_view_height(view_camera[0]);
view_width = camera_get_view_width(view_camera[0]);

widthPerCard = (view_width - widthCard) / (cardsNumbers);
//if(widthPerCard < widthCard) {
//	widthPerCard = widthPerCard - (widthCard - widthPerCard)
//}

card = [];

for(var i= 0; i < cardsNumbers; i++) {
	// Utwórz obiekt w lewym dolnym rogu widoku kamery
	// Zakładając, że punkt początkowy sprite'a obiektu card jest w lewym górnym rogu:
	
	card_x = (i * widthPerCard); // + (i * widthOffSet);
	
	card[i] = instance_create_layer(cam_x + card_x, cam_y + view_height - heightCard, global.LAYERS_PAUSE_GUI, obj_card);
	if(i % 2 == 0) {
		card[i].sprite_index = sprite_card_fireball_1;
	} else {
		card[i].sprite_index = sprite_card_lighting_1;
	}
	card[i].depth -= 10;
	card[i].activeWidth = widthPerCard;
}

