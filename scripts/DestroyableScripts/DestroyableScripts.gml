// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
function my_initialize_destroyable_object()
{
	my_max_health = 10;
	my_current_health = my_max_health;

	my_RECEIVE_DAMAGE_function = my_DEFAULT_RECEIVE_DAMAGE_function; // required format function(_self_obj, _from_obj, _damage) {};
	
	my_use_defualt_hit_animation = true;
	
	my_hit_animation_duration = 10; // frames
	my_hit_animation_duration_counter = 0; // frames
}

function my_set_max_health(_object, _value_to_set)
{
	_object.my_current_health = _value_to_set
	_object.my_max_health = _object.my_current_health
}


function my_DEFAULT_RECEIVE_DAMAGE_function(_self_obj, _from_obj, _damage) {
	var _damageReceived = my_apply_damage(_self_obj, _damage);
	my_check_if_dead(self);
	return _damageReceived;
}




