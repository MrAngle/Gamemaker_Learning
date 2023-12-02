// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
global.COLONY_ARRAY = []

function my_GLOBAL_add_colony(_colonyObject) {
    global.COLONY_ARRAY[ array_length(global.COLONY_ARRAY) ] = _colonyObject;
	show_debug_message("DODAJE Kolonie: " + string(_colonyObject))
}

function my_GLOBAL_remove_colony(_colonyObject) {
    for (var _i = 0; _i < array_length(global.COLONY_ARRAY); _i++) {
        if (global.COLONY_ARRAY[_i] == _colonyObject) {
            global.COLONY_ARRAY = array_delete(global.COLONY_ARRAY, _i, 1);
			show_debug_message("USUWAM Kolonie: " + string(_colonyObject))
            break;
        }
    }
}

