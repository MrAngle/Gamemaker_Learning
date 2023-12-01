global.GUI_MANAGER = undefined;
function initGuiManager() {
	if(global.GUI_MANAGER == undefined) {
		global.GUI_MANAGER = instance_create_layer(0, 0, global.LAYERS_INVISIBLE, obj_GUI_manager);
		global.GUI_MANAGER.initGUI(global.GUI_MANAGER);
	}
	return global.GUI_MANAGER;
}

function getGuiManager() {
	if(global.GUI_MANAGER == undefined) {
		global.GUI_MANAGER = instance_create_layer(0, 0, global.LAYERS_INVISIBLE, obj_GUI_manager);
		global.GUI_MANAGER.initGUI(global.GUI_MANAGER);
	}
	return global.GUI_MANAGER;
}