	my_set_aim_angle(self, my_calculate_direction_value(my_get_direction(self)));
    //my_set_speed(self, 0);
	my_STATE_aiming = true;



var _modificator = MoveTimeModifier(
	self,             // Obiekt, który zostanie zmodyfikowany.
	self,             // Obiekt źródłowy wywołujący modyfikację.
	ImmobizableModificatorSprite,             // Sprite, który ma być wyświetlany jako ikona efektu.
	MY_SKILL_LIST.AIMING,    // Enum reprezentujący umiejętność lub efekt.
	99999,    // Czas trwania efektu w sekundach.
	global.MY_EMPTY_FUNCTION_WITH_2_PARAMS,      // Funkcja, która zostanie wywołana (może być pusta).
	0,				// Wartość modyfikatora, np. zmiana prędkości.
	false                // Boolowska wartość określająca, czy efekt można skumulować.
);		

add_new_Modifier(_modificator, ModificatorTypeMajor.MOVEMENT);  // zatrzymuje postać na 5 sekund (przy założeniu, że gra działa w 60 FPS)
