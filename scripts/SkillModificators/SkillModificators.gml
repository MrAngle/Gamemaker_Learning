global.MODIFICATOR_ID = "modificator_id";
global.MODIFICATOR_KEY = "modificator_key";

function my_INHERITENCE_skill_modificator(_obj)
{
	my_CONSTRUCTOR_default_skill_modificator_init(_obj);
}

function my_CONSTRUCTOR_default_skill_modificator_init(_instance) {
    _instance.modificator_objects_list = ds_list_create();
}

function my_DESTRUCTOR_skill_modificator(_obj) {
	ds_list_destroy(_obj.modificator_objects_list);
}

function get_modificator_by_modificator_id(_skill_obj, _target_id) {
    for (var i = 0; i < ds_list_size(_skill_obj.modificator_objects_list); i++) {
        var _obj = _skill_obj.modificator_objects_list[| i];
        if (_obj[? global.MODIFICATOR_ID] == _target_id) {
            return _obj[? global.MODIFICATOR_KEY];
        }
    }
    return undefined;
}


function add_modificator_object(_skill_obj, _modificator_obj, _modificator_key) {
    var _hit_obj = ds_map_create();
    _hit_obj[? global.MODIFICATOR_ID] = _modificator_key;
    _hit_obj[? global.MODIFICATOR_KEY] = _modificator_obj;
    
    ds_list_add(_skill_obj.modificator_objects_list, _hit_obj);
}
