privPaused = false;
pause_surface = undefined;
resumeButton = undefined;
cardSelector = undefined;

stopTheGame = function(_self) {
	privStopGameWithSnapshot(_self);
	privPrepareCardSelector(_self);
	privPrepareResumeButton(_self);
}

startTheGame = function(_self) {
	_self.privPaused = false;
	startNewTurn();
	instance_activate_all();
	
	resumeButton = undefined;
	
}

privStopGameWithSnapshot = function(_self) {
	_self.privPaused = true;
    // Uzyskaj bieżącą skalę kamery
    var zoomFactor = getZoomFactor();
    
    // Ustal wymiary surface z uwzględnieniem skali
    var surfaceWidth = camera_get_view_width(view_camera[0]) * getZoomFactor();
    var surfaceHeight = camera_get_view_height(view_camera[0]) * getZoomFactor();
    
    // Stwórz surface o odpowiednich wymiarach
    _self.pause_surface = surface_create(surfaceWidth, surfaceHeight);
	
	surface_copy(_self.pause_surface, 0, 0, application_surface);
	
	instance_deactivate_all(true);
	getGuiManager().activeGuiForPause(getGuiManager());
}

privPrepareResumeButton = function(_self) {
	with(_self) {
		var cam_x = camera_get_view_x(view_camera[0]);
		var cam_y = camera_get_view_y(view_camera[0]);
		_self.resumeButton = instance_create_layer(cam_x, cam_y, global.LAYERS_PAUSE_GUI, obj_button);
		_self.resumeButton.paramToUseForFunction = self;
		_self.resumeButton.onClickedAction = function(_self, _buttonRef) {
			_self.startTheGame(_self);
			with (_buttonRef)
			{instance_destroy();}
			with (_self.cardSelector)
			{instance_destroy();}
		}
	}
}

privPrepareCardSelector = function(_self) {
	var cam_x = camera_get_view_x(view_camera[0]);
	var cam_y = camera_get_view_y(view_camera[0]);
	_self.cardSelector = instance_create_layer(cam_x, cam_y, global.LAYERS_PAUSE_GUI, obj_card_selector);
}
