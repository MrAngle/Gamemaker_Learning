
if(turnDurationCounter > 0) {
	draw_set_colour(c_white); // Ustaw kolor tekstu na biały
	draw_set_font(getGUIFont("fnt_hud"));
	
	var seconds = floor(turnDurationCounter / global.MY_ROOM_SPEED) + 1;

	
	var turnDurationTxt = string(seconds); // Konwertuj czas na tekst
		
	var textWidth = string_width(turnDurationTxt);
    var x_position = display_get_gui_width() - (textWidth + 20);
	draw_text(x_position, y+150, turnDurationTxt);
} else {
	var turnDurationTxt = "(STOP...)";
	var textWidth =  string_width(turnDurationTxt);
    var x_position = display_get_gui_width() - (textWidth + 20);
	draw_text(x_position, y+50, turnDurationTxt);
}

