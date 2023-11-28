privPaused = false;
pause_surface = undefined;

resumeButton = undefined;
cardSelector = undefined;

button_x = 500; // X position of the button in the GUI layer
button_y = 150; 

cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);
//global.camera_x = cam_x;
//global.camera_y = cam_y;

stopTheGame = function(_self) {
	

	_self.pause_surface = surface_create(	camera_get_view_width(view_camera[0]), 
											camera_get_view_height(view_camera[0]));
	_self.cam_x = camera_get_view_x(view_camera[0]);
	_self.cam_y = camera_get_view_y(view_camera[0]);
	surface_copy(_self.pause_surface, 0, 0, application_surface);
	//global.camera_x = cam_x;

	resumeButton = instance_create_layer(_self.cam_x, _self.cam_y, global.LAYERS_PAUSE_GUI, obj_button);
	
	resumeButton.paramToUseForFunction = self;
	resumeButton.onClickedAction = function(_self, _buttonRef) {
		_self.startTheGame(_self);
		with (_buttonRef)
		{instance_destroy();}
	}
	_self.privPaused = true; // Toggle pause state
	
	instance_deactivate_all(true);
	instance_activate_object(obj_button);
	
	cardSelector = instance_create_layer(_self.cam_x, _self.cam_y, global.LAYERS_PAUSE_GUI, obj_card_selector);
	//resumeButton.instance_deactivate_all(true);
}	

startTheGame = function(_self) {
	_self.privPaused = false;
	instance_activate_all();
	
	resumeButton = undefined;
}
