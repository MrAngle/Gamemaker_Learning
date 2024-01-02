function custom_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = true;
    _instance.my_current_direction = MY_Direction.LEFT;
    _instance.my_priv_base_speed = 0.5;
}
my_object_moveable_init_function = custom_moveable_init;

function custom_sprites_init(_instance) {
	_instance.my_sprite_MOVEABLE_UP = sSlime_Walk;
    _instance.my_sprite_MOVEABLE_DOWN = sSlime_Walk;
    _instance.my_sprite_MOVEABLE_LEFT = sSlime_Walk;
    _instance.my_sprite_MOVEABLE_RIGHT = sSlime_Walk;
	_instance.my_sprite_MOVEABLE_IDLE = sSlime_Idle;
}
my_object_specific_sprites_init_function = custom_sprites_init;
// Create Event w obiekcie-dziecku (przed wywołaniem event_inherited()):



event_inherited();

moveStrategy = function(_self) {
	MOVE_STRATEGY_SELF_goToNearestInRadius_PER_FRAME(_self);
	//MOVE_STRATEGY_goToNearestInRadius_PER_FRAME(_self, _self.targetingObj.priv_targetType, _self.targetingObj.priv_targetDistanceRadius, _self.stopDistance);
}

attackInterval = 0.2 * global.MY_ROOM_SPEED;
attackIntervalCounter = attackInterval;
attackStrategy = function(_self) {
	if(attackIntervalCounter <= 0) {
		attackIntervalCounter = attackInterval;
		ATTACK_STRATEGY_SELF_attackTargetWithSkill_PER_FRAME(_self, obj_sword_attack_1);
	}
	attackIntervalCounter -= 1;
}

my_set_max_health(self, 40);