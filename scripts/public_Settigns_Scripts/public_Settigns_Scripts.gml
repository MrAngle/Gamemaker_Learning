// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
global.RESOLUTION_MANAGER = undefined;

enum ZoomLevels {
    Normal,
    Medium,
    Far
}

function getZoomFactor() {
	return global.RESOLUTION_MANAGER.zoomFactor;
}

function getResolutionManager() {
	if(global.RESOLUTION_MANAGER == undefined) {
		loadSettings();
	}
	return global.RESOLUTION_MANAGER;
}


function getZoomLevel() {
	var zoom = getZoomFactor();
	switch (zoom) {
        case 1:
            return ZoomLevels.Normal
        case 2:
            return ZoomLevels.Medium
        //case ZoomLevels.Far:
        //    zoomFactor = 3;
        //    break;
    }
	return ZoomLevels.Normal;
}

function scaleObjectBasedOnGlobalSettings(_obj) {
	_obj.image_xscale = _obj.image_xscale * getZoomFactor();
	_obj.image_yscale = _obj.image_yscale * getZoomFactor();
}

function loadSettings() {
	//gpu_set_texfilter(false); 
	global.RESOLUTION_MANAGER = instance_create_layer(x, y, global.LAYERS_INVISIBLE, obj_resolution_manager);
	
	global.RESOLUTION_MANAGER.obj_Player = global.players[0];
}



function publicChangeResolution() {
	global.RESOLUTION_MANAGER.changeResolution(global.RESOLUTION_MANAGER);
}