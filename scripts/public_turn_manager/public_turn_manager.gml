// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
global.TURN_MANAGER = undefined;
function getTurnManager() {
	if(global.TURN_MANAGER == undefined) {
		global.TURN_MANAGER = instance_create_layer(0, 0, global.LAYERS_INVISIBLE, obj_turn_manager);
	}
	return global.TURN_MANAGER;
}

function startNewTurn() {
	global.TURN_MANAGER.stopCount = false;
	global.TURN_MANAGER.turnDurationCounter = global.TURN_MANAGER.turnDuration;
	global.TURN_MANAGER.alarm[0] = global.TURN_MANAGER.turnDuration;
}



//function stopTurn() {
//	global.TURN_MANAGER.startNewTurn = true;
//}