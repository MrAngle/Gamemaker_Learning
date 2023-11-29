
skillRef = get_params_byName_from_global_map(global.CONSTRUCTOR_PARAMS_SKILL_CARD)[0];

event_inherited();



functionOnMouseEnter = function(_self) {
	with(_self) {
		if (functionIsOnActivePart_returnBoolean(_self)) {
			cam_x = camera_get_view_x(view_camera[0]);
			cam_y = camera_get_view_y(view_camera[0]);

			view_height = camera_get_view_height(view_camera[0]);
			view_width = camera_get_view_width(view_camera[0]);
	
			createDescriptionCard(x + (sprite_width), y - (sprite_height), self, _self.skillRef);
		}
	}
}


functionByFrameStep = function(_self) {
	with(_self) {
		if (functionIsOnActivePart_returnBoolean(_self)) {
			cam_x = camera_get_view_x(view_camera[0]);
			cam_y = camera_get_view_y(view_camera[0]);

			// Pobierz wysokość widoku kamery
			view_height = camera_get_view_height(view_camera[0]);
			view_width = camera_get_view_width(view_camera[0]);

			if(global.SINGLETON_DESCRIPTION_CARD == undefined) {
				createDescriptionCard(x + (sprite_width), y - (sprite_height), self, _self.skillRef);
				self.layer = layer_get_id(global.LAYERS_PAUSE_GUI_DESCRIPTIONS);
			}
		} else {
			self.layer = layer_get_id(global.LAYERS_PAUSE_GUI);
		}
	}
}