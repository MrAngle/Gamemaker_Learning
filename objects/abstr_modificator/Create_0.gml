modificator = get_params_byName_from_global_map(global.CONSTRUCTOR_PARAM_MODIFIERS)[0];
modificator[global.MODIFICATOR_OBJECT_REFERENCE_KEY] = self;

target = modificator[global.MODIFICATOR_TARGET_KEY];
source = modificator[global.MODIFICATOR_SOURCE_KEY];

x_offset = 0;

show_tooltip = false;
show_debug_message("TWORZE MODIFICATOR " + string(id));


// W wydarzeniu Create obiektu
effect_duration = modificator[global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY]; // Czas trwania efektu w sekundach
effect_timer = effect_duration; // Timer odliczający czas
bar_full_width = 100; // Pełna szerokość paska postępu

alarm[0] = 60;


if(obj_is_player(modificator[global.MODIFICATOR_TARGET_KEY])) {
	drawModificatorIcon = function(_self) {
		_self.drawDurationBar(_self);
		_self.drawToolTip(_self);

		draw_self();
		_self.drawStackNumber(_self, PLAYER_modificatorDescription);
	}
	processModificatorIconByStep = function(_self) {
		_self.processModificatorIconByClassTypeByStepFrame(_self);
		_self.processShowToolTipByStep(_self);
	}

} else {
	drawModificatorIcon = function(_self) {
	    var target = _self.modificator[global.MODIFICATOR_TARGET_KEY];
	    var scale_factor = 32 / 64; // Skalowanie z 64x64 do 32x32
		
		_self.x = target.x + x_offset - (target.sprite_width * scale_factor) - 10;
		_self.y = target.y - (target.sprite_height  * scale_factor) - 50;
		
		_self.image_xscale = scale_factor;
		_self.image_yscale = scale_factor;
		draw_self();

		_self.drawStackNumber(_self, ENEMY_modificatorStackNumber);
	}
	processModificatorIconByStep = function(_self) {
		_self.processModificatorIconByClassTypeByStepFrame(_self);
	}
}


update_modifier_positionFunction = function(_self) {
	update_modifier_position(_self.modificator[global.MODIFICATOR_TARGET_KEY])
}

drawDurationBar = function(_self) {
	if (instance_exists(_self.id) && isTimeClassType(_self.modificator[global.MODIFICATOR_CLASS_TYPE_KEY])) {
		// W wydarzeniu Create obiektu
		//var timer = modificator[global.MODIFICATOR_DURATION_IN_FRAME_RATE_KEY];
	
		var effect_duration = _self.modificator[global.MODIFICATOR_DURATION_IN_FRAME_RATE_KEY]; // Czas trwania efektu w sekundach
		var effect_timer = _self.modificator[global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY]; // Timer odliczający czas
		var bar_full_width = sprite_width; // Pełna szerokość paska postępu

		var bar_current_width = (effect_timer / effect_duration) * bar_full_width;
    
		// Rysowanie paska postępu
		var bar_height = 10; // Ustawienie wysokości paska
		var bar_x = _self.x; // Ustawienie X dla lewego rogu paska
		var bar_y = _self.y + _self.sprite_height + 5 // + (index * modifier_spacing); // Ustawienie Y dla lewego rogu paska, 5 pikseli poniżej obiektu
		draw_rectangle(bar_x, bar_y, bar_x + bar_current_width, bar_y + bar_height, false);
	}
}

drawToolTip = function(_self) {
		// W wydarzeniu Draw GUI gry lub obiektu odpowiedzialnego za GUI
	if (_self.show_tooltip) {
		draw_set_font(PLAYER_modificatorDescription);
	    var tooltip_x = device_mouse_x_to_gui(0); // Możesz dodać przesunięcie, jeśli chcesz
	    var tooltip_y = device_mouse_y_to_gui(0); // Możesz dodać przesunięcie, jeśli chcesz
	
		var text = _self.modificator[global.MODIFICATOR_DEFAULT_DESCRIPTION];

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
}

drawStackNumber = function(_self, _font) {
	if(_self.modificator[global.MODIFICATOR_STACK_NUMBER_KEY] > 1) {
		var number_to_draw = string(_self.modificator[global.MODIFICATOR_STACK_NUMBER_KEY]) + string("x"); // Liczba do narysowania

		draw_set_font(_font);
		draw_set_colour(c_white); // Ustaw kolor tekstu na biały

		// Oblicz pozycję lewego dolnego rogu obiektu
		var x_pos = _self.x;
		var y_pos = _self.y + _self.sprite_height;

		// Oblicz szerokość i wysokość tekstu
		var text_width = string_width(number_to_draw);
		var text_height = string_height(number_to_draw);

		// Rysuj czarne tło pod tekstem
		var padding = 4; // Dodaj trochę paddingu dookoła tekstu
		var alpha = 0.5;
		draw_set_alpha(alpha);

		// Teraz rysujemy czarne tło z użyciem przezroczystości
		draw_set_colour(c_black); // Ustaw kolor rysowania na czarny
		draw_rectangle(x_pos - padding, y_pos - text_height, x_pos + text_width + padding, y_pos, false);

		// Powrót do pełnej nieprzezroczystości dla tekstu
		draw_set_alpha(1);
		
		draw_set_colour(c_white); // Ustaw kolor tekstu na biały
		draw_text(x_pos, y_pos - text_height, number_to_draw);
		//draw_set_font(noone);
	}
}

processModificatorIconByClassTypeByStepFrame = function(_self) {
	if(isTimeClassType(modificator[global.MODIFICATOR_CLASS_TYPE_KEY])) {
		if (modificator[global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY] <= 0) {
			with (self)
			{instance_destroy();}
		}
	} else {
	if(isAuraClassType(modificator[global.MODIFICATOR_CLASS_TYPE_KEY])) {

	}}
	
	
	if (modificator[global.MODIFICATOR_IS_DELETED_KEY] == true || !instance_exists(_self.target)) {
		with (self)
		{instance_destroy();}
	}
}

processShowToolTipByStep = function(_self) {
	var mx = device_mouse_x_to_gui(0); // Pobierz pozycję kursora myszy w GUI
	var my = device_mouse_y_to_gui(0); // Pobierz pozycję kursora myszy w GUI

	// Sprawdzanie, czy kursor znajduje się nad obiektem
	if (point_in_rectangle(mx, my, x - sprite_width, y - sprite_height, x + sprite_width, y + sprite_height)) {
		_self.show_tooltip = true;
	} else {
		_self.show_tooltip = false;
	}
}


// ===================================DAMAGE====================================


processModificatorDOTS_PER_ALARM_returnAlarmIntervalPerFrame = function(_self) {
}

if(isDOTClassType(modificator[global.MODIFICATOR_CLASS_TYPE_KEY])) {
	processModificatorDOTS_PER_ALARM_returnAlarmIntervalPerFrame = function(_self) {
		_self.target.my_RECEIVE_DAMAGE_function(_self.target, _self.source, _self.modificator[global.MODIFICATOR_DAMAGE_DOT]);
		return _self.modificator[global.MODIFICATOR_INTERVAL_TIME_IN_FRAME_RATE_KEY];
	}
	alarm[1] = self.modificator[global.MODIFICATOR_INTERVAL_TIME_IN_FRAME_RATE_KEY]
}




