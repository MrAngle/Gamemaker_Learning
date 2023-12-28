// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
function npc_alarm1(_self) 
{
	with(_self) {
		if(_self.targetingObj.priv_currentTargetRef != undefined && instance_exists(_self.targetingObj.priv_currentTargetRef)) {
			self.stopDistance = calculateStopDistance(self);
		}
		alarm[1] = global.MY_ROOM_SPEED / 2
	}
}