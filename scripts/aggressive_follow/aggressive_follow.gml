// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
function aggressive_zombie_type_follow_player(_obj) 
{
	var _closest_player_coordinates = my_GLOBAL_get_coordinates_of_closest_player(_obj.x, _obj.y);
	var _dir = point_direction(_obj.x, _obj.y, _closest_player_coordinates[0], _closest_player_coordinates[1]);
	
	_obj.x += lengthdir_x(my_get_speed(_obj), _dir);
	_obj.y += lengthdir_y(my_get_speed(_obj), _dir);

	//show_debug_message("go to: " + string(_closest_player_coordinates[0]) + " - " +
	//string(_closest_player_coordinates[1]))


	//show_debug_message("go to: " + string(_dir))
}