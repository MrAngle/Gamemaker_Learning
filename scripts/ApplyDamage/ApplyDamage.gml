// @argument0 - id

function my_check_if_dead(_health) {
	if(_health < 1) {
		instance_destroy();
	} else {
		//show_message("pozaIfem " + string(_health) );
		//show_debug_message(string(_health));
	}
	
	//if (!is_undefined(_instance_id)){
	
		//show_message("test " + string(instanceId))
	//} else {
	//	show_message("pozaIfem ")
	//}
}

function my_apply_damage(id, _health, _damage) {
	//show_debug_message(string(id) + " ZADANO: " + string(_damage));
	return _health - _damage;
}

function my_run_hit_animation(_object, _health, _damage){
	_object.image_blend = $FF0000FF & $ffffff;
	_object.image_alpha = ($FF0000FF >> 24) / $ff;
}

//var instanceId = argument0





//function ApplyDamage() constructor {
//    my_apply_damage = function(id) {
//        // Tutaj umieść kod funkcji
//    };
//}