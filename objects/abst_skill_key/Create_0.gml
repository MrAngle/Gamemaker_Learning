event_inherited();

skillRef = undefined

setSkillCard = function(_self, _cardSprite, _skillRef) {
    // Określ docelowe wymiary
    var target_width = sprite_get_width(_self.card_sprite);
    var target_height = sprite_get_height(_self.card_sprite);

    // Utwórz nową powierzchnię
    var temp_surface = surface_create(target_width, target_height);
    surface_set_target(temp_surface);
    draw_clear_alpha(c_black, 0); // Wyczyść powierzchnię

    // Rysuj sprite na powierzchni ze skalowaniem
    draw_sprite_stretched(_cardSprite, 0, 0, 0, target_width, target_height);

    // Przywróć standardową powierzchnię rysowania
    surface_reset_target();

    // Utwórz nowy sprite z powierzchni
    _self.card_sprite = sprite_create_from_surface(temp_surface, 0, 0, target_width, target_height, false, false, 0, 0);
	_self.skillRef = _skillRef;
    // Usuń tymczasową powierzchnię
    surface_free(temp_surface);
}

