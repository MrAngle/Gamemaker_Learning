function custom_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = true;
    _instance.my_current_direction = MY_Direction.LEFT;
    _instance.my_priv_base_speed = 0.5;
}

function custom_sprites_init(_instance) {
	_instance.my_sprite_MOVEABLE_UP = Sprite7072;
    _instance.my_sprite_MOVEABLE_DOWN = Sprite7072;
    _instance.my_sprite_MOVEABLE_LEFT = Sprite7072;
    _instance.my_sprite_MOVEABLE_RIGHT = Sprite7072;
	_instance.my_sprite_MOVEABLE_IDLE = Sprite7072;
}

my_object_specific_sprites_init_function = custom_sprites_init;
my_object_moveable_init_function = custom_moveable_init;

event_inherited();

moveStrategy = function(_self) {
	MOVE_STRATEGY_SELF_goToNearestInRadius_PER_FRAME(self);
	//MOVE_STRATEGY_goToNearestInRadius_PER_FRAME(_self, _self.targetingObj.priv_targetType, _self.targetingObj.priv_targetDistanceRadius, _self.stopDistance);
}

attackInterval = 0.2 * global.MY_ROOM_SPEED;
attackIntervalCounter = attackInterval;
attackStrategy = function(_self) {
	if(attackIntervalCounter <= 0) {
		attackIntervalCounter = attackInterval;
		ATTACK_STRATEGY_SELF_attackTargetWithSkill_PER_FRAME(_self, obj_sword_attack_1);
		//ATTACK_STRATEGY_attackTargetWithSkill_PER_FRAME(_self, _self.targetEnemyRef, _self.reachedTarget, obj_sword_attack_1);
	}
	attackIntervalCounter -= 1;
}



my_set_max_health(self, 1000);