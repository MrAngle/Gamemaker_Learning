//if (keyboard_check(vk_shift)) {
	
	//show_debug_message("USTAWIAM _ SHIFT")
	//my_set_aim_angle(self, my_calculate_direction_value(my_get_direction(self)));
    //my_set_speed(self, 0);
//}


if(my_STATE_aiming) {
	my_aim_calculate_aim_angle(self);
}