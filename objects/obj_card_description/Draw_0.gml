// Draw Event dla obiektu karty
draw_self();
szerokosc_linii = 300 * getZoomFactor();
przerwa_miedzy_liniami = 15 * getZoomFactor();

offset_nazwy = sprite_width/2 + 87 * getZoomFactor();
offset_opisu = sprite_width/2 + 150 * getZoomFactor();

// Rysowanie nazwy karty
draw_set_font(getFontBasedOnZoom("fnt_cardTitle"));
draw_set_colour(make_colour_rgb(255, 215, 0));
draw_set_halign(fa_center); // Wyśrodkuj tekst w poziomie
draw_set_valign(fa_top); // Wyrównaj tekst do góry

draw_text_ext(x + sprite_width / 2, y + offset_nazwy, nazwa_karty, 
	przerwa_miedzy_liniami, 
	szerokosc_linii );

// Rysowanie opisu karty
draw_set_font(getFontBasedOnZoom("fnt_cardDescription"));
draw_set_colour(c_black);
draw_text_ext(x + sprite_width/2, y + offset_opisu, opis_karty, przerwa_miedzy_liniami , szerokosc_linii);

draw_set_font(noone);