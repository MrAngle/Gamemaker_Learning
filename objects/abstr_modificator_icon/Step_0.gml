if (modificator[global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY] <= 0) {
	with (self)
	{instance_destroy();}
} else {
	var mx = device_mouse_x_to_gui(0); // Pobierz pozycję kursora myszy w GUI
	var my = device_mouse_y_to_gui(0); // Pobierz pozycję kursora myszy w GUI

	// Sprawdzanie, czy kursor znajduje się nad obiektem
	if (point_in_rectangle(mx, my, x - sprite_width, y - sprite_height, x + sprite_width, y + sprite_height)) {
	    show_tooltip = true;
	} else {
	    show_tooltip = false;
	}
}
// Przykładowe wartości offsetów
//var offset_x = 10;
//var offset_y = 5;

//// Ustaw pozycję obiektu w lewym górnym rogu ekranu z offsetem
//x = view_xview[0] + offset_x; // Domyślnie view_xview[0] jest 0, jeśli nie używasz widoków
//y = view_yview[0] + offset_y; // Domyślnie view_yview[0] jest 0, jeśli nie używasz widoków

//show_debug_message("Pozycja x: " + string(x) + ", y: " + string(y));
////if (view_enabled) {
//    x = view_xview[0] + offset_x; // offset_x to dodatkowe przesunięcie, jeśli jest potrzebne
//    y = view_yview[0] + offset_y; // offset_y to dodatkowe przesunięcie, jeśli jest potrzebne
//} else {
//    x = offset_x;
//    y = offset_y;
//}