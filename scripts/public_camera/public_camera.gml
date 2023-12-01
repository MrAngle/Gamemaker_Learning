// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
global.CONSTRUCTOR_PARAMS_CAMERA = "CONSTRUCTOR_PARAMS_CAMERA";
global.CAMERA = undefined;
function getCamera() {
	//if(global.CAMERA == undefined) {
	//	global.CAMERA = instance_create_layer(0, 0, global.LAYERS_INVISIBLE, obj_GUI_manager);
	//	global.CAMERA.init(global.CAMERA);
	//}
	return global.GUI_MANAGER;
}

function initCamera(_player) {
	if(global.CAMERA == undefined) {
		var constrParams = [];
		constrParams[0] = _player;
		add_params_byName_for_new_obj(global.CONSTRUCTOR_PARAMS_CAMERA, constrParams);
		
		global.CAMERA = instance_create_layer(0, 0, global.LAYERS_INVISIBLE, obj_camera);
	}
	return global.GUI_MANAGER;
}