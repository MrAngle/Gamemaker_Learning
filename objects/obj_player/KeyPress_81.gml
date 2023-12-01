//var sword = instance_create_layer(x + 0, y + 0, "Instances", obj_lighting_attack_1);


//if(my_STATE_aiming) {
//	var _aim_angle = my_get_aim_angle(self);
//	my_skill_invoke_3(self, self.x, self.y, "Instances", getSkill(KEYS_INDEX.Q), 
//		my_calculate_direction_enum(_aim_angle), _aim_angle, undefined)
//} else {
//	my_skill_invoke(self, self.x, self.y, "Instances", getSkill(KEYS_INDEX.Q), self.my_current_direction)
//}


var skillRef = obj_fireball_attack_1;
if(my_STATE_aiming) {
	var _aim_angle = my_get_aim_angle(self);
	my_skill_invoke_3(self, self.x, self.y, global.LAYERS_INSTANCES, skillRef, 
		my_calculate_direction_enum(_aim_angle), _aim_angle, undefined)
} else {
	my_skill_invoke(self, self.x, self.y, global.LAYERS_INSTANCES, skillRef, self.my_current_direction)
}