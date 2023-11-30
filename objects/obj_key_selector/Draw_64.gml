var button_width = 68; // Szerokość przycisku
var button_height = 72; // Wysokość przycisku
var spacing = 3; // Odległość między przyciskami

var _scale = 0.8;
//	var center_offset_x = (sprite_get_width(sprite_card_empty_68x81) - sprite_get_width(sprite_q_button_68x68) * scale) / 2;
//	var center_offset_y = (sprite_get_height(sprite_card_empty_68x81) - sprite_get_height(sprite_q_button_68x68) * scale) / 2;

var center_offset_x = sprite_get_width(sprite_card_empty_68x81)/4;
var center_offset_y = sprite_get_height(sprite_card_empty_68x81)/1.5

var num_buttons = array_length(keys); // Liczba przycisków
var total_width = (num_buttons * button_width) + ((num_buttons - 1) * spacing); // Całkowita szerokość wszystkich przycisków plus odstępy
var start_x = display_get_width() - (total_width*2.9); // Początkowa pozycja x (od prawego górnego rogu)
var start_y = 10; // Początkowa pozycja y (niewielka odległość od górnej krawędzi)

var currentPosition = start_x;

// W zdarzeniu Draw GUI
for (var i = 0; i < num_buttons; i++) {
    var _x = start_x + (i * (button_width + spacing));
    var _y = start_y;

	draw_sprite(keys[i].card_sprite, i, _x, _y);

	draw_sprite_ext(
		keys[i].sprite_index, 
		i, 
		_x + center_offset_x, 
		_y + center_offset_y, 
		_scale, 
		_scale, 
		0, 
		c_white, 
		1)
}
