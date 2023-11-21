	my_set_aim_angle(self, my_calculate_direction_value(my_get_direction(self)));
    //my_set_speed(self, 0);
	my_STATE_aiming = true;
	
var _modifier_id = MY_MOVE_MODIFICATOR_TYPE.AIMING;  // przykładowy unikalny identyfikator modyfikatora
add_speed_modifier(self, _modifier_id, 0, 300);  // zatrzymuje postać na 5 sekund (przy założeniu, że gra działa w 60 FPS)
