// Definition of the Modifier structure
function Modifier(
    //_type,
    _effectValue,
    _duration_in_seconds,
    _isStackable,
    _timeToTick_in_seconds,
    //_impactScope,
    _source
) {
    var _this = {
        //type: _type, // "buff" or "debuff"
        effectValue: _effectValue, // e.g., 0.1 for 10%
        duration_in_seconds: _duration_in_seconds, // in seconds
        isStackable: _isStackable, // true/false
        timeToTick_in_seconds: _timeToTick_in_seconds, // in seconds
        //impactScope: _impactScope, // e.g., "health", "speed"
        source: _source, // e.g., "fire_potion"
        stacks: 1, // default is 1 stack

        apply: function(target) {
            // Logic for applying the modifier to the target
            // Insert code here
        },

        update: function() {
            // Logic for updating the state of the modifier (e.g., decreasing duration)
            // Insert code here
        }
    };

    return _this;
};

// Definition of the MoveModifier structure, which extends Modifier
function MoveModifier(_effectValue, _duration, _isStackable, _timeToTick, _source, _moveModifier) {
    var _base = Modifier(_effectValue, _duration, _isStackable, _timeToTick, _source);
    
    // Dodanie nowego pola do struktury MoveModifier
    var _this = {
        base: _base, // Zawiera wszystkie metody i właściwości bazowe
        moveModifier: _moveModifier, // Nowe dodatkowe pole

        // Można nadpisać metody bazowe lub dodać nowe
        apply: function(target) {
            // Wywołanie metody bazowej z możliwą modyfikacją
            this.base.apply(target);
            // Dodatkowa logika specyficzna dla MoveModifier
            target.speed += this.base.effectValue * this.moveModifier;
        },

        // Jeśli chcesz aktualizować bazowe właściwości, możesz dodać nową metodę lub nadpisać istniejącą
        update: function() {
            this.base.update(); // Wywołanie aktualizacji bazowej
            // Możliwe dodatkowe operacje...
        }
    };

    return _this;
};

// Użycie struktury Modyfikator
//var modyfikator = Modifier(10, 60, true, 1, "potion");
//modyfikator.zastosuj(cel); // cel to obiekt, na który ma wpływ modyfikator
//modyfikator.aktualizuj();