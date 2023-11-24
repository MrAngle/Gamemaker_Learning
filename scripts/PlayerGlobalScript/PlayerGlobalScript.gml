global.players = [];
//global.players[0] = {};  // Gracz 1
//global.players[1] = {};  // Gracz 2

function my_GLOBAL_get_player_coordinates() {
	var _result = [global.player1.x, global.player1.y];
	return _result;
}

/// @description add_player(player_object)
/// @param _player_object Object of the player to be added
function my_GLOBAL_add_player(_player_object) {
    global.players[ array_length(global.players) ] = _player_object;
	show_debug_message("DODAJE GRACZA: " + string(_player_object))
}

/// @description remove_player(player_object)
/// @param _player_object Object of the player to be removed
function my_GLOBAL_remove_player(_player_object) {
    for (var _i = 0; _i < array_length(global.players); _i++) {
        if (global.players[_i] == _player_object) {
            global.players = array_delete(global.players, _i, 1);
			show_debug_message("USUWAM GRACZA: " + string(_player_object))
            break;
        }
    }
}


function obj_is_player(_instance) {
	var _id = _instance.id;
    for (var i = 0; i < array_length(global.players); i++) {
        if (global.players[i].id == _id) {
            return true;
        }
    }
    return false;
}


/// @description get_closest_player(x, y)
/// @param x X-coordinate of the point of reference
/// @param y Y-coordinate of the point of reference
/// @return list [x, y] of the closest player
function my_GLOBAL_get_coordinates_of_closest_player(_x, _y) {
    var _closest_distance = -1;
    var _closest_player_coords = [-1, -1];
    
    for (var i = 0; i < array_length(global.players); i++) {
        var _player = global.players[i];
        var _distance = point_distance(_x, _y, _player.x, _player.y);

        if (_closest_distance == -1 || _distance < _closest_distance) {
            _closest_distance = _distance;
            _closest_player_coords = [_player.x, _player.y];
        } else {
			//show_debug_message("NIe znalkazlo grazca" + string(global.players.length))
		}
    }

    return _closest_player_coords;
}