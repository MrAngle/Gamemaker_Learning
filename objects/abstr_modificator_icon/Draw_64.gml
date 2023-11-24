//var modifier_spacing = 15; // Odległość między paskami modyfikatorów
//var index = getNumberOfActiveModifiers(modificator[global.MODIFICATOR_TARGET_KEY]) - 1; // Numer porządkowy danego modyfikatora, który musisz określić

//var _base_x = 0;
//x = _base_x + (index * 64) + (index *modifier_spacing)

if (instance_exists(id) && isTimeClassType(modificator[global.MODIFICATOR_CLASS_TYPE_KEY])) {
	// W wydarzeniu Create obiektu
	//var timer = modificator[global.MODIFICATOR_DURATION_IN_FRAME_RATE_KEY];
	
	var effect_duration = modificator[global.MODIFICATOR_DURATION_IN_FRAME_RATE_KEY]; // Czas trwania efektu w sekundach
	var effect_timer = modificator[global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY]; // Timer odliczający czas
	var bar_full_width = sprite_width; // Pełna szerokość paska postępu

	var bar_current_width = (effect_timer / effect_duration) * bar_full_width;
    
	// Rysowanie paska postępu
	var bar_height = 10; // Ustawienie wysokości paska
	var bar_x = x; // Ustawienie X dla lewego rogu paska
	var bar_y = y + sprite_height + 5 // + (index * modifier_spacing); // Ustawienie Y dla lewego rogu paska, 5 pikseli poniżej obiektu
	draw_rectangle(bar_x, bar_y, bar_x + bar_current_width, bar_y + bar_height, false);
	

}

// W wydarzeniu Draw GUI gry lub obiektu odpowiedzialnego za GUI
if (show_tooltip) {
    var tooltip_x = device_mouse_x_to_gui(0); // Możesz dodać przesunięcie, jeśli chcesz
    var tooltip_y = device_mouse_y_to_gui(0); // Możesz dodać przesunięcie, jeśli chcesz
	
	var text = modificator[global.MODIFICATOR_DEFAULT_DESCRIPTION];

    // Opcjonalnie: oblicz szerokość i wysokość tooltipu
    var text_width = string_width(text);
    var text_height = string_height(text);

    // Rysowanie tła tooltipu
    draw_set_colour(c_black);
    draw_rectangle(tooltip_x, tooltip_y, tooltip_x + text_width + 8, tooltip_y + text_height + 8, false);

    // Rysowanie tekstu tooltipu
    draw_set_colour(c_white);
    draw_text(tooltip_x + 4, tooltip_y + 4, text); // +4 piksele dla małego marginesu
}

draw_self();