// Określenie aktywnego obszaru karty (np. górna połowa)

// Sprawdzenie, czy mysz jest w aktywnym obszarze
//if (mouse_x >= active_area_top && mouse_x <= active_area_bottom + sprite_width && mouse_y >= y && mouse_y <= ) {
//    // Mysz jest nad aktywnym obszarem, wykonaj działania
//}

//if (mouse_x >= x && mouse_x <= x + activeWidth && mouse_y >= y && mouse_y <= y + sprite_height) {
//    // Mysz jest nad aktywnym obszarem, wykonaj odpowiednie działania
//} else {
//	//destoryDescriptionCard();
//	//show_debug_message("WYCHODZE");
//}


if (mouse_x >= x + activeWidth && mouse_x <= x + sprite_width && mouse_y >= y && mouse_y <= y + sprite_height) {
	cam_x = camera_get_view_x(view_camera[0]);
	cam_y = camera_get_view_y(view_camera[0]);

	// Pobierz wysokość widoku kamery
	view_height = camera_get_view_height(view_camera[0]);
	view_width = camera_get_view_width(view_camera[0]);

	if(global.SINGLETON_DESCRIPTION_CARD == undefined) {
		createDescriptionCard(x + (sprite_width), y - (sprite_height), self);
		self.layer = layer_get_id(global.LAYERS_PAUSE_GUI_DESCRIPTIONS);
	}
} else {
	self.layer = layer_get_id(global.LAYERS_PAUSE_GUI);
}
	