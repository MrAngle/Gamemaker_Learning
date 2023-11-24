if(isTimeClassType(modificator[global.MODIFICATOR_CLASS_TYPE_KEY])) {
	if (modificator[global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY] <= 0) {
		with (self)
		{instance_destroy();}
	}
} else {

if(isAuraClassType(modificator[global.MODIFICATOR_CLASS_TYPE_KEY])) {
	//if (!instance_exists(id)) {
	//	with (self)
	//	{instance_destroy();}
	//}
}}


var mx = device_mouse_x_to_gui(0); // Pobierz pozycję kursora myszy w GUI
var my = device_mouse_y_to_gui(0); // Pobierz pozycję kursora myszy w GUI

// Sprawdzanie, czy kursor znajduje się nad obiektem
if (point_in_rectangle(mx, my, x - sprite_width, y - sprite_height, x + sprite_width, y + sprite_height)) {
	show_tooltip = true;
} else {
	show_tooltip = false;
}
