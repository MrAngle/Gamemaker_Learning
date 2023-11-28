


if (self.privPaused) {
	draw_surface(self.pause_surface, 0, 0);
	
	//if(resumeButton == undefined) {
	//	resumeButton = instance_create_layer(0, 0, global.LAYERS_INVISIBLE, obj_button);
	//	resumeButton.paramToUseForFunction = self;
	//	resumeButton.onClickedAction = function(_self) {
	//		_self.startTheGame(_self);
	//	}
	//}

//instance_create_layer(0, 0, global.LAYERS_INVISIBLE, obj_button);

	// Draw GUI Event of the object obj_Button
	button_x = 500; // X position of the button in the GUI layer
	button_y = 150; // Y position of the button in the GUI layer
	draw_sprite(spr_resume, 0, button_x, button_y); // Replace spr_button with your sprite's name
} else {
	resumeButton = undefined;
}