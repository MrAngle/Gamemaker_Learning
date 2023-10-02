function my_draw_health_bar(_object) 
{
	if (instance_exists(_object) && 
		variable_instance_exists(_object, "my_current_health") && 
		variable_instance_exists(_object, "my_max_health")) {
		with(_object) {
			// Wymiary i pozycja paska zdrowia
			var bar_width = 50;  // Szerokość paska zdrowia
			var bar_height = 5;  // Wysokość paska zdrowia
			var bar_x = _object.x - bar_width/2;  // Pozycja X początku paska
			var bar_y = _object.y - _object.sprite_height/2 - 10;  // Pozycja Y początku paska, nad postacią

			// Rysowanie tła paska zdrowia (np. kolor czerwony)
			draw_set_color(c_red);
			draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

			// Rysowanie aktualnego zdrowia na pasku (np. kolor zielony)
			draw_set_color(c_green);
			var health_width = (_object.my_current_health/_object.my_max_health) * bar_width;  // Obliczenie szerokości paska zdrowia na podstawie aktualnego zdrowia
			draw_rectangle(bar_x, bar_y, bar_x + health_width, bar_y + bar_height, false);
		}
	}
}