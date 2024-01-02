function custom_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = true;
    _instance.my_current_direction = MY_Direction.RIGHT;
    _instance.my_priv_base_speed = 6;
}



my_object_moveable_init_function = custom_moveable_init;
event_inherited();

my_skill_name = MY_SKILL_LIST.LIFE_WALL_1;

if(self.my_priv_create_in_description_mode) {
	my_skill_description = "TO DO damage ranging from " + string(self.my_min_damage) + " to " + 
			string(self.my_max_damage) + ". Upon hitting the target, applies a burning modifier."
}

on_collision_function = function(_self) {
	with (_self)
	{
		instance_destroy();
		//instance_create_depth(_self.target.x, _self.target.y, _self.depth, obj_lifeWall1);
	}
}

on_destroy_function = function(_self) {
	with (_self)
	{
		if(_self.inCollistionTarget) {
			instance_create_depth(_self.inCollistionTarget.x, _self.inCollistionTarget.y, _self.depth, obj_lifeWall1);
		} else {
			instance_create_depth(_self.x, _self.y, _self.depth, obj_lifeWall1);
		}
	}
}

LIFE_WALL_ATTACK_1_action(self);

hit_time_interval = 10;