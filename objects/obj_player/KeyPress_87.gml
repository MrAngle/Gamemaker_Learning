
if(my_STATE_aiming) {
	var _aim_angle = my_get_aim_angle(self);
	my_skill_invoke_3(self, self.x, self.y, "Instances", obj_wind_1, 
		my_calculate_direction_enum(_aim_angle), _aim_angle, undefined)
} else {
	my_skill_invoke(self, self.x, self.y, "Instances", obj_wind_1, self.my_current_direction)
}