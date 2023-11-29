// Draw Event dla obiektu karty
draw_self();
szerokosc_linii = 300;
przerwa_miedzy_liniami = 15;

offset_nazwy = sprite_width/2 + 87;
offset_opisu = sprite_width/2 + 150;

// Rysowanie nazwy karty
draw_set_font(fnt_cardTitle); // Ustaw odpowiednią czcionkę
draw_set_colour(make_colour_rgb(255, 215, 0));
draw_set_halign(fa_center); // Wyśrodkuj tekst w poziomie
draw_set_valign(fa_top); // Wyrównaj tekst do góry
//draw_text(x + sprite_width/2, y + offset_nazwy, nazwa_karty);

draw_text_ext(x + sprite_width / 2, y + offset_nazwy, nazwa_karty, 
przerwa_miedzy_liniami, 
szerokosc_linii );


// Rysowanie opisu karty
draw_set_font(fnt_cardDescription); // Ustaw odpowiednią czcionkę dla opisu
//draw_set_colour(make_colour_rgb(0, 0, 0));
draw_set_colour(c_black);
//draw_rectangle(x + sprite_width/2 - szerokosc_linii/2, y + offset_opisu, x + sprite_width/2 + szerokosc_linii/2, y + offset_opisu + 100, false);
//draw_set_valign(fa_top); // Możesz chcieć, aby tekst opisu zaczynał się od góry
draw_text_ext(x + sprite_width/2, y + offset_opisu, opis_karty, przerwa_miedzy_liniami , szerokosc_linii);


//var offset_nazwy = 20; // Dostosuj do położenia w obrębie sprite'a karty
//var offset_opisu = 100; // Dostosuj do położenia w obrębie sprite'a karty
//var szerokosc_linii = 400; // Szerokość linii tekstu dla opisu
//var przerwa_miedzy_liniami = 15; // Odstęp między liniami tekstu

// Rysowanie nazwy karty
//draw_set_font(fnt_cardTitle); // Ustawienie czcionki dla nazwy
////draw_set_colour(c_white); // Ustawienie koloru tekstu na biały
//draw_set_colour(make_colour_rgb(255, 215, 0));
//draw_set_halign(fa_center); // Centrowanie tekstu
//draw_set_valign(fa_top); // Ustawienie tekstu od góry

////draw_set_halign(fa_left);
////draw_set_valign(fa_top);
//draw_text_ext(x + sprite_width / 2, y + offset_nazwy, "Nazwa22 2 Czaru", przerwa_miedzy_liniami, szerokosc_linii );

//// Tworzenie i rysowanie opisu karty
//var text_surface = surface_create(szerokosc_linii, przerwa_miedzy_liniami * 3); // Wysokość dostosowana do ilości linii
//surface_set_target(text_surface);
//draw_clear_alpha(c_black, 0); // Wyczyszczenie powierzchni

//// Ustawienia czcionki i koloru tekstu dla opisu
//draw_set_font(fnt_cardDescription);
//draw_set_colour(c_black);

//// Rysowanie tekstu na powierzchni
//draw_text_ext(x + sprite_width / 2, y + offset_opisu, "Tutaj wpisz opis czaru, który może zajmować kilka linii...", 
//					szerokosc_linii, przerwa_miedzy_liniami);

//// Resetowanie celu rysowania na domyślny
//surface_reset_target();

//// Rysowanie powierzchni z tekstem na karcie
//draw_surface(text_surface, x + sprite_width / 2 - szerokosc_linii / 2, y + offset_opisu);

