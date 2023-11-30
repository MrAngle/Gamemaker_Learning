global.PAUSE_MANAGER = undefined;
function getPauseManager() {
	if(global.PAUSE_MANAGER == undefined || !instance_exists(global.PAUSE_MANAGER)) {
		global.PAUSE_MANAGER = instance_create_layer(0, 0, global.LAYERS_INVISIBLE, obj_pause_manager);
	}
	return global.PAUSE_MANAGER;
}