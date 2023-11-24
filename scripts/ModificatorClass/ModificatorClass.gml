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
	AURA_MOVEMENT
}

function isTimeClassType(_typeEnum) {
	return	_typeEnum == MODIFIER_CLASS_TYPE.TIME || 
			_typeEnum == MODIFIER_CLASS_TYPE.TIME_MOVEMENT;
}

function isAuraClassType(_typeEnum) {
	return	_typeEnum == MODIFIER_CLASS_TYPE.AURA || 
			_typeEnum == MODIFIER_CLASS_TYPE.AURA_MOVEMENT;
}



global.MODIFICATOR_SOURCE_KEY = 10000;
global.MODIFICATOR_TARGET_KEY = 10001;
global.MODIFICATOR_SPRITE_KEY = 10002;
global.MODIFICATOR_SKILL_NAME_KEY = 10003;
global.MODIFICATOR_DEFAULT_DESCRIPTION = 10004;
global.MODIFICATOR_SKILL_NAME_ID_KEY = 10005;
global.MODIFICATOR_CLASS_TYPE_KEY = 10006;


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
	
	_this[global.MODIFICATOR_SKILL_NAME_KEY] = global.SKILL_NAMES[? _skill_name_enum];
	_this[global.MODIFICATOR_SKILL_NAME_ID_KEY] = _skill_name_enum;
	
	_this[global.MODIFICATOR_DEFAULT_DESCRIPTION] = _this[global.MODIFICATOR_SKILL_NAME_KEY];

    return _this;
};

global.MODIFICATOR_DURATION_IN_FRAME_RATE_KEY = 10010
global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY = 10011
global.MODIFICATOR_ON_DELETE_KEY = 10012

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
		
	_this[global.MODIFICATOR_DEFAULT_DESCRIPTION] = _this[global.MODIFICATOR_DEFAULT_DESCRIPTION] + string("\nDuration: ") + string(_duration_in_seconds);

    return _this;
};




global.MODIFICATOR_EFFECT_VALUE_KEY = 10020;
global.MODIFICATOR_IS_STACKABLE_KEY = 10021;

// Definition of the MoveModifier structure, which extends Modifier
function MoveTimeModifier(_target, _source, _sprite, _skill_name_enum, _duration_in_seconds, _onDelete_function, _effectValue, _isStackable) {
    var _this = TimeModifier(_target, _source, _sprite, _skill_name_enum, _duration_in_seconds, _onDelete_function);
	
	_this[global.MODIFICATOR_CLASS_TYPE_KEY] = MODIFIER_CLASS_TYPE.TIME_MOVEMENT;
	
	//_this[global.MODIFICATOR_CLASS_TYPE_KEY] = MODIFIER_CLASS_TYPE.TIME_MOVEMENT;
	
	//_this[global.MODIFICATOR_EFFECT_VALUE_KEY] = _effectValue
	//_this[global.MODIFICATOR_IS_STACKABLE_KEY] = _isStackable
	
	
	//_this[global.MODIFICATOR_SOURCE_KEY] = _source;
	//_this[global.MODIFICATOR_TARGET_KEY] = _target;
	//_this[global.MODIFICATOR_ON_DELETE_KEY] = _onDelete_function;
	
	//_this[global.MODIFICATOR_DEFAULT_DESCRIPTION] = _this[global.MODIFICATOR_DEFAULT_DESCRIPTION] 
	//	+ string("\nEFFECT VALUE: ") + string(_this[global.MODIFICATOR_EFFECT_VALUE_KEY]);

    return AddMoveModifierAttributesPriv(_this, _effectValue, _isStackable);
};

function MoveAuraModifier(_target, _source, _sprite, _skill_name_enum, _onDelete_function, _effectValue, _isStackable) {
    var _this = AuraModifier(_target, _source, _sprite, _skill_name_enum, _onDelete_function);
	
	_this[global.MODIFICATOR_CLASS_TYPE_KEY] = MODIFIER_CLASS_TYPE.AURA_MOVEMENT;

    return AddMoveModifierAttributesPriv(_this, _effectValue, _isStackable)
};


function AddMoveModifierAttributesPriv(_this_base_modifier, _effectValue, _isStackable) {
	
	//_this_base_modifier[global.MODIFICATOR_CLASS_TYPE_KEY] = MODIFIER_CLASS_TYPE.TIME_MOVEMENT;
	
	_this_base_modifier[global.MODIFICATOR_EFFECT_VALUE_KEY] = _effectValue
	_this_base_modifier[global.MODIFICATOR_IS_STACKABLE_KEY] = _isStackable
	
	
	//_this_base_modifier[global.MODIFICATOR_SOURCE_KEY] = _source;
	//_this_base_modifier[global.MODIFICATOR_TARGET_KEY] = _target;
	//_this_base_modifier[global.MODIFICATOR_ON_DELETE_KEY] = _onDelete_function;
	
	_this_base_modifier[global.MODIFICATOR_DEFAULT_DESCRIPTION] = _this_base_modifier[global.MODIFICATOR_DEFAULT_DESCRIPTION] 
		+ string("\nEFFECT VALUE: ") + string(_this_base_modifier[global.MODIFICATOR_EFFECT_VALUE_KEY]);

    return _this_base_modifier;
};



// Użycie struktury Modyfikator
//var modyfikator = Modifier(10, 60, true, 1, "potion");
//modyfikator.zastosuj(cel); // cel to obiekt, na który ma wpływ modyfikator
//modyfikator.aktualizuj();




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

























// Definition of the Modifier structure
//function TimeModifier(
//    _duration_in_seconds,
//    _isStackable,
//    _timeToTick_in_seconds,
//    //_impactScope,
//    _source
//) {
//    var _this = {

//        duration_in_seconds: _duration_in_seconds, // in seconds
//        isStackable: _isStackable, // true/false
//        timeToTick_in_seconds: _timeToTick_in_seconds, // in seconds
//        //impactScope: _impactScope, // e.g., "health", "speed"
//        source: _source, // e.g., "fire_potion"
//        stacks: 1, // default is 1 stack

//        apply: function(target) {
//            // Logic for applying the modifier to the target
//            // Insert code here
//        },

//        update: function() {
//            // Logic for updating the state of the modifier (e.g., decreasing duration)
//            // Insert code here
//        }
//    };

//    return _this;
//};

//// Definition of the MoveModifier structure, which extends Modifier
//function MoveModifier(_effectValue, _duration, _isStackable, _timeToTick, _source, _moveModifier) {
//    var _base = Modifier(_effectValue, _duration, _isStackable, _timeToTick, _source);
    
//    // Dodanie nowego pola do struktury MoveModifier
//    var _this = {
//        base: _base, // Zawiera wszystkie metody i właściwości bazowe
//        moveModifier: _moveModifier, // Nowe dodatkowe pole

//        // Można nadpisać metody bazowe lub dodać nowe
//        apply: function(target) {
//            // Wywołanie metody bazowej z możliwą modyfikacją
//            this.base.apply(target);
//            // Dodatkowa logika specyficzna dla MoveModifier
//            target.speed += this.base.effectValue * this.moveModifier;
//        },

//        // Jeśli chcesz aktualizować bazowe właściwości, możesz dodać nową metodę lub nadpisać istniejącą
//        update: function() {
//            this.base.update(); // Wywołanie aktualizacji bazowej
//            // Możliwe dodatkowe operacje...
//        }
//    };

//    return _this;
//};
