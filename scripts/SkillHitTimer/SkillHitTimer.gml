function my_INHERITENCE_skill_hit_timer(_obj)
{
	my_CONSTRUCTOR_default_skill_hit_timer_init(_obj);
}

function my_CONSTRUCTOR_default_skill_hit_timer_init(_instance) {
    _instance.hit_timer_objects_list = ds_list_create();
    _instance.hit_time_interval = 10;
}

function my_DESTRUCTOR_skill_hit_timer(_obj) {
	ds_list_destroy(_obj.hit_timer_objects_list);
}

function my_SHOULD_PROCESS_ActionBasedOn_HIT_TIMER(_skill_obj, _target_obj) {
	if(object_is_in_hit_list(_skill_obj, _target_obj.id))
		return false;
		
	addHitTimerObject(_skill_obj, _target_obj);
	return true;
}


function object_is_in_hit_list(_skill_obj, _target_id) {
    for (var i = 0; i < ds_list_size(_skill_obj.hit_timer_objects_list); i++) {
        var obj = _skill_obj.hit_timer_objects_list[| i];
        if (obj[? "id"] == _target_id) {
            return true;
        }
    }
    return false;
}


function addHitTimerObject(_skill_obj, _target_obj) {
    var _hit_obj = ds_map_create();
    _hit_obj[? "id"] = _target_obj.id;
    _hit_obj[? "time_left"] = global.MY_ROOM_SPEED * _skill_obj.hit_time_interval;
    
    ds_list_add(_skill_obj.hit_timer_objects_list, _hit_obj);
}

function my_PROCESS_hitTimerCleaner(_skill_obj) {
	for (var _i = 0; _i < ds_list_size(_skill_obj.hit_timer_objects_list); _i++) {
	    var _hit_obj = _skill_obj.hit_timer_objects_list[| _i];
	    _hit_obj[? "time_left"]--;
    
	    if (_hit_obj[? "time_left"] <= 0) {
	        ds_list_delete(_skill_obj.hit_timer_objects_list, _i);
	        _i--;
	    }
	}
}





