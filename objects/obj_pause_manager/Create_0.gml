privPaused = false;
pause_surface = undefined;

resumeButton = undefined;

button_x = 500; // X position of the button in the GUI layer
button_y = 150; 

//cam_x = camera_get_view_x(view_camera[0]);
//cam_y = camera_get_view_y(view_camera[0]);
//global.camera_x = cam_x;
//global.camera_y = cam_y;

stopTheGame = function(_self) {
	_self.privPaused = true; // Toggle pause state

	_self.pause_surface = surface_create(	camera_get_view_width(view_camera[0]), 
											camera_get_view_height(view_camera[0]));
	var cam_x = camera_get_view_x(view_camera[0]);
	var cam_y = camera_get_view_y(view_camera[0]);
	surface_copy(_self.pause_surface, 0, 0, application_surface);
	//global.camera_x = cam_x;

	//instance_create_layer(0, 0, global.LAYERS_INVISIBLE, obj_button);

	instance_deactivate_all(true);
}	

startTheGame = function(_self) {
	_self.privPaused = false;
	instance_activate_all();
}
