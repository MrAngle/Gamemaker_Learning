

if (mouse_x >= x + activeWidth && mouse_x <=  x + sprite_width  && mouse_y >= y && mouse_y <= y + sprite_height) {
	cam_x = camera_get_view_x(view_camera[0]);
	cam_y = camera_get_view_y(view_camera[0]);

	// Pobierz wysokość widoku kamery
	view_height = camera_get_view_height(view_camera[0]);
	view_width = camera_get_view_width(view_camera[0]);

	//if(global.SINGLETON_DESCRIPTION_CARD == undefined) {
	
	createDescriptionCard(x + (sprite_width), y - (sprite_height), self);
		//self.layer = layer_get_id(global.LAYERS_PAUSE_GUI_DESCRIPTIONS);
		//descriptionCard = instance_create_layer(
		//x + (sprite_width/2), 
		//y - (sprite_height/2), 
		//global.LAYERS_PAUSE_GUI_DESCRIPTIONS, 
		//obj_card_description);
	//}
}
	