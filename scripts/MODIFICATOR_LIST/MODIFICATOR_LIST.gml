// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377


function MODIFICATOR_AIMING_returnMODIFICATOR(_obj) {
	
	var _modificator = MoveAuraModifier(
		_obj,             // Obiekt, który zostanie zmodyfikowany.
		_obj,             // Obiekt źródłowy wywołujący modyfikację.
		ImmobizableModificatorSprite,             // Sprite, który ma być wyświetlany jako ikona efektu.
		MY_SKILL_LIST.AIMING,    // Enum reprezentujący umiejętność lub efekt.
		global.MY_EMPTY_FUNCTION_WITH_2_PARAMS,      // Funkcja, która zostanie wywołana (może być pusta).
		0,				// Wartość modyfikatora, np. zmiana prędkości.
		false                // Boolowska wartość określająca, czy efekt można skumulować.
	)
	
	return _modificator;
}

function MODIFICATOR_WIND_1_returnMODIFICATOR(_targetObject, _sourceObject) {
	var _modificator = MoveTimeModifier(
		_targetObject,             // Obiekt, który zostanie zmodyfikowany.
		_sourceObject,             // Obiekt źródłowy wywołujący modyfikację.
		SlowModificatorSprite,             // Sprite, który ma być wyświetlany jako ikona efektu.
		MY_SKILL_LIST.WIND_1,    // Enum reprezentujący umiejętność lub efekt.
		3,    // Czas trwania efektu w sekundach.
		global.MY_EMPTY_FUNCTION_WITH_2_PARAMS,      // Funkcja, która zostanie wywołana (może być pusta).
		0.1,				// Wartość modyfikatora, np. zmiana prędkości.
		true                // Boolowska wartość określająca, czy efekt można skumulować.
	);			

	return _modificator;
}

function MODIFICATOR_FIRE_DOT_1_returnMODIFICATOR(_targetObject, _sourceObject) {
	var _modificator = DOTModifier(
		_targetObject,             // Obiekt, który zostanie zmodyfikowany.
		_sourceObject,             // Obiekt źródłowy wywołujący modyfikację.
		sprite_fireball_dot_1,             // Sprite, który ma być wyświetlany jako ikona efektu.
		MY_SKILL_LIST.FIREBALL_1,    // Enum reprezentujący umiejętność lub efekt.
		5,								// Cas trwania efektu
		global.MY_EMPTY_FUNCTION_WITH_2_PARAMS,      // Funkcja, która zostanie wywołana (może być pusta).
		5,				// dmg
		true,                // Boolowska wartość określająca, czy efekt można skumulować.
		0.5				// interval
	);			

	return _modificator;
}