	my_set_aim_angle(self, my_calculate_direction_value(my_get_direction(self)));
    //my_set_speed(self, 0);
	my_STATE_aiming = true;



var _modificator = MODIFICATOR_AIMING_returnMODIFICATOR(self);

add_new_Modifier(_modificator);  // zatrzymuje postać na 5 sekund (przy założeniu, że gra działa w 60 FPS)
