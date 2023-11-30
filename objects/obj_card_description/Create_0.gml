var constrParams = get_params_byName_from_global_map(global.CONSTRUCTOR_PARAMS_SKILL_DESCRIPTION_CARD);
cardReference = constrParams[0];
skillRef = constrParams[1];

//show_debug_message("TWORZE DESCRIPTION");
nazwa_karty = global.SKILL_NAMES[? cardReference.my_skill_name];
opis_karty = cardReference.my_skill_description;