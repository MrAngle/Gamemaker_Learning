// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377

// TRZEBA OSOBNO NAME I WARTOSC
enum MY_SKILL_LIST {
	NOT_DEFINED,
	
	AIMING,
	
	// ATTACKS
	WIND_1
}



global.SKILL_NAMES = ds_map_create();
global.SKILL_NAMES[? MY_SKILL_LIST.NOT_DEFINED] = "Hmm... I dont know";

// attacks
global.SKILL_NAMES[? MY_SKILL_LIST.WIND_1] = "Wind basic";
global.SKILL_NAMES[? MY_SKILL_LIST.AIMING] = "Aiming";