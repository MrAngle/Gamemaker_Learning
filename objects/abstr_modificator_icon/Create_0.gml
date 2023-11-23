modificator[global.MODIFICATOR_SPRITE_KEY] = EmptyModificatorSprite;
modificator[global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY] = 999999;
modificator[global.MODIFICATOR_DURATION_IN_FRAME_RATE_KEY] = 999999;
modificator[global.MODIFICATOR_TARGET_KEY] = {};

show_tooltip = false;

show_debug_message("TWORZE MODIFICATOR " + string(id));


// W wydarzeniu Create obiektu
effect_duration = modificator[global.MODIFICATOR_PRIVATE_COUNTER_IN_FRAME_RATE_KEY]; // Czas trwania efektu w sekundach
effect_timer = effect_duration; // Timer odliczający czas
bar_full_width = 100; // Pełna szerokość paska postępu
