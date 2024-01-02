// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
global.MY_GRID_MAP_PATH = mp_grid_create(0, 0, 32, 32, 32, 32);
global.MY_GRID_MAP_PATH_CELL_SIZE = 32;

function create_grid_map_path() {
	show_debug_message("Tworze MY_GRID_MAP_PATH");
	global.MY_GRID_MAP_PATH = mp_grid_create(0, 0, room_width, room_height, global.MY_GRID_MAP_PATH_CELL_SIZE, global.MY_GRID_MAP_PATH_CELL_SIZE);
	add_to_grid_map_path(obj_editor_wall);
	//add_to_grid_map_path(abst_destroyable_obstacle);
	//add_to_grid_map_path(obj_editor_wall);
}

function add_to_grid_map_path(_objToAdd) {
	mp_grid_add_instances(global.MY_GRID_MAP_PATH, _objToAdd, false);
}

function create_path_finder_returnObject(_self) {
	var pathFinder = {
		path: path_add(),
		foundPath: false,
		reachedTarget: false,
		destinationX: undefined,
		destinationY: undefined
	}
	
	return pathFinder
}

function MY_find_path_returnTrueIfFound(_self) {
	if (mp_grid_path(global.MY_GRID_MAP_PATH, 
					_self.pathFinder.path, 
					_self.x, 
					_self.y, 
					_self.targetingObj.priv_currentTargetRef.x, 
					_self.targetingObj.priv_currentTargetRef.y, 
					true)) {
	    // Ścieżka znaleziona
		_self.pathFinder.destinationX = _self.targetingObj.priv_currentTargetRef.x;
		_self.pathFinder.destinationY = _self.targetingObj.priv_currentTargetRef.y;
		
	    path_start(_self.pathFinder.path, my_get_speed(_self), path_action_stop, false);
		_self.pathFinder.foundPath = true;
	} else {
	    // Ścieżka nieznaleziona
		show_debug_message("nie znalazlem");
		_self.pathFinder.foundPath = false;
	}
	return _self.pathFinder.foundPath;
}

function FORCE_TO_UPDATE_PATH(_self) {
	if(!instance_exists(_self) || !instance_exists(_self.targetingObj.priv_currentTargetRef) || isNull(_self.targetingObj.priv_currentTargetRef)) {
		return;
	}
	
	//if(_self.targetingObj.priv_currentTargetRef.x != _self.pathFinder.destinationX &&
	//	_self.targetingObj.priv_currentTargetRef.y != _self.pathFinder.destinationY) {
		_self.pathFinder.foundPath = false;
	//}
}