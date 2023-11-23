//global.MODIFICATOR_KEY_MAJOR_TYPE = "major_type_key";
//global.MODIFICATOR_KEY_SUB_TYPE = "sub_type_key";
//global.MODIFICATOR_KEY_SKILL_ID = "skill_id_key";
//global.MODIFICATOR_KEY_DURATION_IN_FRAME_SPEED = "duration_in_room_speed_key";
//global.MODIFICATOR_KEY_INTERVAL_IN_FRAME_SPEED = "interval_in_frame_key";
//global.MODIFICATOR_PRIVATE_KEY_COUNTER = "priv_counter_key";

global.MODIFICATOR_SOURCE_KEY = 10000;
global.MODIFICATOR_TARGET_KEY = 10001;
global.MODIFICATOR_SPRITE_KEY = 10002;
global.MODIFICATOR_SKILL_NAME_KEY = 10003;
global.MODIFICATOR_DEFAULT_DESCRIPTION = 10004;
global.MODIFICATOR_SKILL_NAME_ID_KEY = 10005;


function BaseModifier(
    _target,
	_source,
	_sprite,
	_skill_name_enum
) {
    var _this = {};
	
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
	
	_this[global.MODIFICATOR_DURATION_IN_FRAME_RATE_KEY] = _duration_in_seconds * global.MY_ROOM_SPEED;
	_this[global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY] = _duration_in_seconds * global.MY_ROOM_SPEED;
	_this[global.MODIFICATOR_ON_DELETE_KEY] = _on_delete_function;
		
	_this[global.MODIFICATOR_DEFAULT_DESCRIPTION] = _this[global.MODIFICATOR_DEFAULT_DESCRIPTION] + string("\nDuration: ") + string(_duration_in_seconds);

    return _this;
};


function processTimeModifierPerFrame(_modifier) {
	_modifier[global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY] -= 1;
}

function processTimeModifiersPerFrame(_modifiers) {
    if (is_undefined(_modifiers) || 
		!ds_exists(_modifiers, ds_type_map) ||
		ds_map_size(_modifiers) < 1) {
        // Debug message
        //show_debug_message("Mapa modyfikatorów prędkości nie istnieje lub nie jest zainicjowana.");
        //// Jeśli nie istnieje, wyjdź z funkcji
        return;
    }

    // Lista kluczy do usunięcia po iteracji
    var _keys_to_remove = ds_list_create();
	
    for (var k = ds_map_find_first(_modifiers); !is_undefined(k); k = ds_map_find_next(_modifiers, k)) {
		var _modifier = _modifiers[? k];
        var _key = k;
        
        // Zaktualizuj czas trwania modyfikatora
        processTimeModifierPerFrame(_modifier)

        // Sprawdź, czy czas trwania modyfikatora dobiegł końca
        if (_modifier[global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY] <= 0) {
            // Dodaj klucz do listy kluczy do usunięcia
			_modifier[global.MODIFICATOR_ON_DELETE_KEY](_modifier[global.MODIFICATOR_TARGET_KEY], 
												_modifier[global.MODIFICATOR_SOURCE_KEY]);
			ds_list_add(_keys_to_remove, _key);
        }
    }

    // Usuń modyfikatory, których czas trwania się zakończył
    for (var i = 0; i < ds_list_size(_keys_to_remove); i++) {
        var _key = ds_list_find_value(_keys_to_remove, i);
		
        ds_map_delete(_modifiers, _key);
    }

    // Zwolnij pamięć
    ds_list_destroy(_keys_to_remove);
}

global.MODIFICATOR_EFFECT_VALUE_KEY = 10020;
global.MODIFICATOR_IS_STACKABLE_KEY = 10021;

// Definition of the MoveModifier structure, which extends Modifier
function MoveTimeModifier(_target, _source, _sprite, _skill_name_enum, _duration_in_seconds, _onDelete_function, _effectValue, _isStackable) {
    var _base = TimeModifier(_target, _source, _sprite, _skill_name_enum, _duration_in_seconds, _onDelete_function);
	
	_base[global.MODIFICATOR_EFFECT_VALUE_KEY] = _effectValue
	_base[global.MODIFICATOR_IS_STACKABLE_KEY] = _isStackable
	
	
	_base[global.MODIFICATOR_SOURCE_KEY] = _source;
	_base[global.MODIFICATOR_TARGET_KEY] = _target;
	_base[global.MODIFICATOR_ON_DELETE_KEY] = _onDelete_function;
	
	_base[global.MODIFICATOR_DEFAULT_DESCRIPTION] = _base[global.MODIFICATOR_DEFAULT_DESCRIPTION] 
		+ string("\nEFFECT VALUE: ") + string(_base[global.MODIFICATOR_EFFECT_VALUE_KEY]);

    return _base;
};

// Użycie struktury Modyfikator
//var modyfikator = Modifier(10, 60, true, 1, "potion");
//modyfikator.zastosuj(cel); // cel to obiekt, na który ma wpływ modyfikator
//modyfikator.aktualizuj();






























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
