//global.MODIFICATOR_KEY_MAJOR_TYPE = "major_type_key";
//global.MODIFICATOR_KEY_SUB_TYPE = "sub_type_key";
//global.MODIFICATOR_KEY_SKILL_ID = "skill_id_key";
//global.MODIFICATOR_KEY_DURATION_IN_FRAME_SPEED = "duration_in_room_speed_key";
//global.MODIFICATOR_KEY_INTERVAL_IN_FRAME_SPEED = "interval_in_frame_key";
//global.MODIFICATOR_PRIVATE_KEY_COUNTER = "priv_counter_key";

enum MODIFIER_CLASS_TYPE {
	BASE,
	TIME,
	AURA,
	TIME_MOVEMENT,
	TIME_DAMAGE,
	AURA_MOVEMENT
}

function isTimeClassType(_typeEnum) {
	return	_typeEnum == MODIFIER_CLASS_TYPE.TIME || 
			_typeEnum == MODIFIER_CLASS_TYPE.TIME_MOVEMENT ||
			_typeEnum == MODIFIER_CLASS_TYPE.TIME_DAMAGE;
}

function isAuraClassType(_typeEnum) {
	return	_typeEnum == MODIFIER_CLASS_TYPE.AURA || 
			_typeEnum == MODIFIER_CLASS_TYPE.AURA_MOVEMENT;
}

function isMOVEMENTClassType(_typeEnum) {
	return	_typeEnum == MODIFIER_CLASS_TYPE.TIME_MOVEMENT || 
			_typeEnum == MODIFIER_CLASS_TYPE.AURA_MOVEMENT;
}

function isDOTClassType(_typeEnum) {
	return	_typeEnum == MODIFIER_CLASS_TYPE.TIME_DAMAGE;
}



global.MODIFICATOR_SOURCE_KEY = 0;
global.MODIFICATOR_TARGET_KEY = 1;
global.MODIFICATOR_SPRITE_KEY = 2;
global.MODIFICATOR_SKILL_NAME_KEY = 3;
global.MODIFICATOR_DEFAULT_DESCRIPTION = 4;
global.MODIFICATOR_SKILL_NAME_ID_KEY = 5;
global.MODIFICATOR_CLASS_TYPE_KEY = 6;
global.MODIFICATOR_IS_DELETED_KEY = 7;
global.MODIFICATOR_STACK_NUMBER_KEY = 8;
global.MODIFICATOR_IS_STACKABLE_KEY = 9;

global.MODIFICATOR_DURATION_IN_FRAME_RATE_KEY = 10
global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY = 11
global.MODIFICATOR_ON_DELETE_KEY = 12
global.MODIFICATOR_ON_RESET_FUNCTION_KEY = 13
global.MODIFICATOR_OBJECT_REFERENCE_KEY = 14;

global.MODIFICATOR_EFFECT_VALUE_KEY = 25;
global.MODIFICATOR_INTERVAL_TIME_IN_FRAME_RATE_KEY = 26;
global.MODIFICATOR_PRIVATE_INTERVAL_COUNTER_TIME_IN_FRAME_RATE_KEY = 27;
global.MODIFICATOR_DAMAGE_DOT = 28;


function BaseModifier(
    _target,
	_source,
	_sprite,
	_skill_name_enum
) {
    var _this = {};
	
	_this[global.MODIFICATOR_CLASS_TYPE_KEY] = MODIFIER_CLASS_TYPE.BASE;
	
	_this[global.MODIFICATOR_SOURCE_KEY] = _source;
	_this[global.MODIFICATOR_TARGET_KEY] = _target;
	_this[global.MODIFICATOR_SPRITE_KEY] = _sprite;
	
	_this[global.MODIFICATOR_IS_DELETED_KEY] = false;
	
	_this[global.MODIFICATOR_STACK_NUMBER_KEY] = 1;
	_this[global.MODIFICATOR_IS_STACKABLE_KEY] = false;
	
	_this[global.MODIFICATOR_OBJECT_REFERENCE_KEY] = undefined;
	
	_this[global.MODIFICATOR_SKILL_NAME_KEY] = global.SKILL_NAMES[? _skill_name_enum];
	_this[global.MODIFICATOR_SKILL_NAME_ID_KEY] = _skill_name_enum;
	
	_this[global.MODIFICATOR_DEFAULT_DESCRIPTION] = _this[global.MODIFICATOR_SKILL_NAME_KEY];

    return _this;
};



// Definition of the Modifier structure
function TimeModifier(
    _target,
	_source,
	_sprite,
	_skill_name_enum,
    _duration_in_seconds,
	_on_delete_function
) {
    var _this = BaseModifier(_target, _source, _sprite, _skill_name_enum);
	
	_this[global.MODIFICATOR_CLASS_TYPE_KEY] = MODIFIER_CLASS_TYPE.TIME;
	
	_this[global.MODIFICATOR_DURATION_IN_FRAME_RATE_KEY] = _duration_in_seconds * global.MY_ROOM_SPEED;
	_this[global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY] = _duration_in_seconds * global.MY_ROOM_SPEED;
	_this[global.MODIFICATOR_ON_DELETE_KEY] = _on_delete_function;
	
	_this[global.MODIFICATOR_ON_RESET_FUNCTION_KEY] = function(_modificatorRef) {
		_modificatorRef[global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY] = _modificatorRef[global.MODIFICATOR_DURATION_IN_FRAME_RATE_KEY];
	};
		
	_this[global.MODIFICATOR_DEFAULT_DESCRIPTION] = _this[global.MODIFICATOR_DEFAULT_DESCRIPTION] + string("\nDuration: ") + string(_duration_in_seconds);

    return _this;
};



// Definition of the MoveModifier structure, which extends Modifier
function MoveTimeModifier(
	_target, 
	_source, 
	_sprite, 
	_skill_name_enum, 
	_duration_in_seconds, 
	_onDelete_function, 
	_effectValue,
	_isStackable
) {
    var _this = TimeModifier(_target, _source, _sprite, _skill_name_enum, _duration_in_seconds, _onDelete_function);
	
	_this[global.MODIFICATOR_CLASS_TYPE_KEY] = MODIFIER_CLASS_TYPE.TIME_MOVEMENT;

    return AddMoveModifierAttributesPriv(_this, _effectValue, _isStackable);
};

function MoveAuraModifier(_target, _source, _sprite, _skill_name_enum, _onDelete_function, _effectValue, _isStackable) {
    var _this = AuraModifier(_target, _source, _sprite, _skill_name_enum, _onDelete_function);
	
	_this[global.MODIFICATOR_CLASS_TYPE_KEY] = MODIFIER_CLASS_TYPE.AURA_MOVEMENT;

    return AddMoveModifierAttributesPriv(_this, _effectValue, _isStackable)
};


function AddMoveModifierAttributesPriv(_this_base_modifier, _effectValue, _isStackable) {
	
	_this_base_modifier[global.MODIFICATOR_EFFECT_VALUE_KEY] = _effectValue
	_this_base_modifier[global.MODIFICATOR_IS_STACKABLE_KEY] = _isStackable
	
	_this_base_modifier[global.MODIFICATOR_DEFAULT_DESCRIPTION] = _this_base_modifier[global.MODIFICATOR_DEFAULT_DESCRIPTION] 
		+ string("\nEFFECT VALUE: ") + string(_this_base_modifier[global.MODIFICATOR_EFFECT_VALUE_KEY]);

    return _this_base_modifier;
};

function AuraModifier(
    _target,
	_source,
	_sprite,
	_skill_name_enum,
	_on_delete_function
) {
    var _this = BaseModifier(_target, _source, _sprite, _skill_name_enum);
	
	_this[global.MODIFICATOR_CLASS_TYPE_KEY] = MODIFIER_CLASS_TYPE.AURA;

	_this[global.MODIFICATOR_ON_DELETE_KEY] = _on_delete_function;
	_this[global.MODIFICATOR_DEFAULT_DESCRIPTION] = _this[global.MODIFICATOR_DEFAULT_DESCRIPTION] + string(" (AURA)");

    return _this;
};



function DOTModifier(
	_target, 
	_source, 
	_sprite, 
	_skill_name_enum, 
	_duration_in_seconds, 
	_onDelete_function, 
	_dotDamage,
	_isStackable,
	_effectIntervalInSeconds
) {
    var _this = TimeModifier(_target, _source, _sprite, _skill_name_enum, _duration_in_seconds, _onDelete_function);
	
	_this[global.MODIFICATOR_CLASS_TYPE_KEY] = MODIFIER_CLASS_TYPE.TIME_DAMAGE;
	
	_this[global.MODIFICATOR_DAMAGE_DOT] = _dotDamage;
	_this[global.MODIFICATOR_IS_STACKABLE_KEY] = _isStackable;
	_this[global.MODIFICATOR_INTERVAL_TIME_IN_FRAME_RATE_KEY] = _effectIntervalInSeconds * global.MY_ROOM_SPEED;
	_this[global.MODIFICATOR_PRIVATE_INTERVAL_COUNTER_TIME_IN_FRAME_RATE_KEY] = 
		_this[global.MODIFICATOR_INTERVAL_TIME_IN_FRAME_RATE_KEY];
	
	_this[global.MODIFICATOR_DEFAULT_DESCRIPTION] = _this[global.MODIFICATOR_DEFAULT_DESCRIPTION] 
		+ string("\nEFFECT VALUE: ") + string(_this[global.MODIFICATOR_EFFECT_VALUE_KEY]);

    return _this;
};
