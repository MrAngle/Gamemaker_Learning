initGUI = function(_self) {
	getKeySelector();
}

activeGuiForPause = function(_self) {
	instance_activate_object(_self);
	instance_activate_object(getKeySelector());
}