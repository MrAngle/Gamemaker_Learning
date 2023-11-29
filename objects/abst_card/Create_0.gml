descriptionCard = undefined;
activeWidth = sprite_width;

functionIsOnActivePart_returnBoolean = function(_self) {
	with(_self) {
		if (mouse_x >= x + activeWidth && mouse_x <=  x + sprite_width && mouse_y >= y && mouse_y <= y + sprite_height) {
			return true;
		}
		return false;
	}
}

functionOnMouseEnter = function(_self) {
}


functionByFrameStep = function(_self) {
}