// @argument0 - id

function my_check_if_dead(_obj) {
    with (_obj) {
        if (_obj.my_current_health < 1) {
            instance_destroy();
        } else {
            // Pozostały kod funkcji
        }
    }
}

function my_apply_damage(_obj, _damage) {
	with (_obj) {
			//show_debug_message(string(id) + " ZADANO: " + string(_damage));
		_obj.my_current_health = _obj.my_current_health - _damage;
		return _damage;
	}
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