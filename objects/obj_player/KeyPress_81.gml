//var sword = instance_create_layer(x + 0, y + 0, "Instances", obj_lighting_attack_1);

//sword.image_xscale = image_xscale;

if(my_STATE_aiming) {
	var _aim_angle = my_get_aim_angle(self);
	my_skill_invoke_3(self, self.x, self.y, "Instances", getKeySelector().keys[KEYS_INDEX.Q].skillRef, 
		my_calculate_direction_enum(_aim_angle), _aim_angle, undefined)
} else {
	my_skill_invoke(self, self.x, self.y, "Instances", getKeySelector().keys[KEYS_INDEX.Q].skillRef, self.my_current_direction)
}
