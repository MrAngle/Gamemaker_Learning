var button_width = 128; // Szerokość przycisku
var button_height = 128; // Wysokość przycisku
var spacing = 10; // Odległość między przyciskami


var num_buttons = 5; // Liczba przycisków
var total_width = (num_buttons * button_width) + ((num_buttons - 1) * spacing); // Całkowita szerokość wszystkich przycisków plus odstępy
var start_x = display_get_width() - (total_width*2); // Początkowa pozycja x (od prawego górnego rogu)
var start_y = 10; // Początkowa pozycja y (niewielka odległość od górnej krawędzi)


// W zdarzeniu Draw GUI
for (var i = 0; i < num_buttons; i++) {
    var _x = start_x + i * (button_width + spacing);
    var _y = start_y;
    //var _x = 0;
    //var _y = 0;
	
	if(i % 2 == 0) {
		draw_sprite(sprite_q_button, i, _x, _y);
	} else {
		draw_sprite(sprite_e_button, i, _x, _y);
	}

    // Tutaj możesz rysować sprite przycisku lub prostokąt jako reprezentację
    // Na przykład, jeśli masz sprite'y przycisków:
     // Zakładając, że masz różne subimage'y dla różnych przycisków
}
