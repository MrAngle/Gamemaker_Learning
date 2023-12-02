if(targetEnemyRef != undefined && instance_exists(targetEnemyRef)) {
	//self.my_current_direction = getDirectionTowardsTarget(x, y, targetEnemyRef.x, targetEnemyRef.y);
	//self.my_current_direction = getAngleTowardsTarget(x, y, targetEnemyRef.x, targetEnemyRef.y);
	self.stopDistance = calculateStopDistance(self);
}
alarm[1] = global.MY_ROOM_SPEED / 2