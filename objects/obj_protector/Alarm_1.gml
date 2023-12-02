if(targetEnemyRef != undefined && instance_exists(targetEnemyRef)) {
	self.my_current_direction = getDirectionTowardsTarget(x, y, targetEnemyRef.x, targetEnemyRef.y);
}
alarm[1] = global.MY_ROOM_SPEED / 2

