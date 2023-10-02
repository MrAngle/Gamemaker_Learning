// Inicjalizacja globalnej mapy
global._my_param_map = ds_map_create();

/// @function add_params_to_map(obj, params)
/// @param obj    Obiekt, dla którego chcesz przechować parametry.
/// @param params Parametry, które chcesz przechować dla obiektu.
/// @description Dodaje parametry do globalnej mapy dla określonego obiektu.
function add_params_for_new_obj(obj, _constr_params) {
    var obj_name = object_get_name(obj);
	show_debug_message("DODAJE DO MAPY: " + obj_name)
    global._my_param_map[? obj_name] = _constr_params;
}

/// @function get_params_from_map(obj)
/// @param obj Obiekt, dla którego chcesz pobrać parametry.
/// @return    Mapa z parametrami dla określonego obiektu.
function get_params_from_global_map(obj) {
    var obj_name = object_get_name(obj);
	//show_debug_message("Probuje wyciagnac po MAPIE: " + string(obj_name))
	show_debug_message("WYCIAGAM Z MAPY: " + obj_name)
    if (global._my_param_map[? obj_name]) {
        var result = global._my_param_map[? obj_name];
		show_debug_message(obj_name)
        //ds_map_delete(global._my_param_map, obj_name);  // usuwa parametry po ich użyciu
        return result;
    } else {
		show_debug_message("NIE MA ELEMENTU W MAPIE")
        return undefined;
    }
}
