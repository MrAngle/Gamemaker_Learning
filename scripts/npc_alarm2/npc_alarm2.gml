// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
function npc_alarm2() 
{
	FORCE_TO_UPDATE_PATH(self);
	alarm[2] = random_range(0.5, 1) * global.MY_ROOM_SPEED;
}