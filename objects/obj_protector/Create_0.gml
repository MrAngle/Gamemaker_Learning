function custom_moveable_init(_instance) {
    _instance.MY_IS_TYPE_MOVEABLE = true;
    _instance.my_is_moveable = true;
    _instance.my_current_direction = MY_Direction.LEFT;
    _instance.my_priv_base_speed = 1.5;
}
my_object_moveable_init_function = custom_moveable_init;

function custom_sprites_init(_instance) {
	_instance.my_sprite_MOVEABLE_UP = Spr_Char_01_Back;
    _instance.my_sprite_MOVEABLE_DOWN = Spr_Char_01_Front;
    _instance.my_sprite_MOVEABLE_LEFT = Spr_Char_01_Side;
    _instance.my_sprite_MOVEABLE_RIGHT = Spr_Char_01_Side;
	_instance.my_sprite_MOVEABLE_IDLE = Spr_Char_01_Side;
}
my_object_specific_sprites_init_function = custom_sprites_init;

targetType = obj_enemy_parent;
targetEnemyRef = undefined;
targetDistanceRadius = 2000;
var _sprite_index = asset_get_index(global.SPRITE_SWORD_ATTACK_1);

// Uzyskaj szerokość i wysokość sprite'a
var _sprite_width = sprite_get_width(_sprite_index);
var _sprite_height = sprite_get_height(_sprite_index);

var _obj_width = sprite_get_width(sprite_index);
var _obj_height = sprite_get_height(sprite_index);

stopDistance = (_sprite_width + _sprite_height + _obj_width + _obj_height ) / 8;
reachedTarget = false;
alarm[1] = global.MY_ROOM_SPEED;

event_inherited();

moveStrategy = function(_self) {
	MOVE_STRATEGY_goToNearestInRadius_PER_FRAME(_self, targetType, targetDistanceRadius, stopDistance);
}

attackStrategy = function(_self) {
	ATTACK_STRATEGY_attackTargetWithSkill_PER_FRAME(_self, _self.reachedTarget, obj_sword_attack_1);
}

my_set_max_health(self, 500);