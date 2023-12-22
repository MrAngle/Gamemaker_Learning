event_inherited();

//targetType = obj_enemy_parent;
//targetEnemyRef = undefined;
//targetDistanceRadius = 2000;
//stopDistance = 50;
//reachedTarget = false;


//alarm[1] = global.MY_ROOM_SPEED;

//moveStrategy = function(_self) {
	
//}

//attackStrategy = function(_self) {
	
//}

//perFrameFunction = function(_self) {
	
//}

//calculateStopDistance = function(_self) {
//	with(_self) {
		
//		var _sprite_index = asset_get_index(global.SPRITE_SWORD_ATTACK_1);
		
//		var _sprite_width = sprite_get_width(_sprite_index);
//		var _sprite_height = sprite_get_height(_sprite_index);

//		var _obj_width = sprite_get_width(sprite_index);
//		var _obj_height = sprite_get_height(sprite_index);

//		stopDistance = (_sprite_width + _sprite_height + _obj_width + _obj_height ) / 8;
	
//		var _collision_width = sprite_get_width(targetEnemyRef.sprite_index);
//		var _collision_height = sprite_get_height(targetEnemyRef.sprite_index);
//		var _collision_offset = ( _collision_width + _collision_height ) / 4; // Średnia z połowy szerokości i wysokości

//		stopDistance += _collision_offset;
		
//		return stopDistance;
//	}
//}