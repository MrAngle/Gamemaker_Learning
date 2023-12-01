global.LAYERS_INSTANCES = "Instances";
global.LAYERS_INVISIBLE = "Invisible";
global.LAYERS_PAUSE_GUI = "PauseGUI";
global.LAYERS_PAUSE_GUI_DESCRIPTIONS = "PauseGUI_Descriptions";
global.LAYERS_MODIFIERS = "Modifiers";



// Inicjalizacja globalnej mapy
global.MY_ROOM_SPEED = room_speed;
global.MY_EMPTY_FUNCTION = function() {};
global.MY_EMPTY_FUNCTION_WITH_2_PARAMS = function(_obj, _source) {};

global.fullsreen = false;


global._my_param_map = ds_map_create();

/// @function add_params_to_map(obj, params)
/// @param obj    Obiekt, dla którego chcesz przechować parametry.
/// @param params Parametry, które chcesz przechować dla obiektu.
/// @description Dodaje parametry do globalnej mapy dla określonego obiektu.
function add_params_for_new_obj(obj, _constr_params) {
	
    var obj_name = object_get_name(obj);
	add_params_byName_for_new_obj(obj_name, _constr_params)
	////show_debug_message("DODAJE DO MAPY: " + obj_name)
    //global._my_param_map[? obj_name] = _constr_params;
}

//var test = [];
// test[0] = _modificator;
//add_params_byName_for_new_obj(global.CONSTRUCTOR_PARAM_MODIFIERS, test);

//modificator = get_params_byName_from_global_map(global.CONSTRUCTOR_PARAM_MODIFIERS)[0];


function add_params_byName_for_new_obj(key_name, _constr_params) {
	//show_debug_message("DODAJE DO MAPY: " + obj_name)
    global._my_param_map[? key_name] = _constr_params;
}

/// @function get_params_from_map(obj)
/// @param _obj Obiekt, dla którego chcesz pobrać parametry.
/// @return    Mapa z parametrami dla określonego obiektu.
function get_params_from_global_map(_obj) {
    var obj_name = object_get_name(_obj);
	
	//get_params_byName_from_global_map(obj_name);
	
	//show_debug_message("Probuje wyciagnac po MAPIE: " + string(obj_name))
	//show_debug_message("WYCIAGAM Z MAPY: " + obj_name)
    if (global._my_param_map[? obj_name]) {
        var result = global._my_param_map[? obj_name];
        //ds_map_delete(global._my_param_map, obj_name);  // usuwa parametry po ich użyciu
        return result;
    } else {
		//show_debug_message("NIE MA ELEMENTU W MAPIE")
        return undefined;
    }
	
}

function get_params_byName_from_global_map(key_name) {
	//show_debug_message("Probuje wyciagnac po MAPIE: " + string(obj_name))
	//show_debug_message("WYCIAGAM Z MAPY: " + obj_name)
    //if (global._my_param_map[? key_name]) {
    //    var result = global._my_param_map[? key_name];
    //    //ds_map_delete(global._my_param_map, obj_name);  // usuwa parametry po ich użyciu
    //    return result;
    //} else {
	//	//show_debug_message("NIE MA ELEMENTU W MAPIE")
    //    return undefined;
    //}
	
	if (ds_map_exists(global._my_param_map, key_name)) {
        // Pobierz wartość z mapy
        var result = ds_map_find_value(global._my_param_map, key_name);
		 ds_map_delete(global._my_param_map, key_name); 
        return result;
    } else {
        //show_debug_message("NIE MA ELEMENTU W MAPIE")
        return undefined;
    }
}

