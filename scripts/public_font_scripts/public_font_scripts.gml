// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377

// Utworzenie mapy fontów
global.fontMap = ds_map_create();

// Dodanie fontów do mapy
ds_map_add(global.fontMap, "fnt_button", fnt_button);
ds_map_add(global.fontMap, "fnt_cardDescription", fnt_cardDescription);
ds_map_add(global.fontMap, "fnt_cardDescription_big", fnt_cardDescription_big);
ds_map_add(global.fontMap, "fnt_cardTitle", fnt_cardTitle);
ds_map_add(global.fontMap, "fnt_cardTitle_big", fnt_cardTitle_big);
ds_map_add(global.fontMap, "fnt_hud", fnt_hud);

function getFontBasedOnZoom(_fontName) {
	var zoomLevel = getZoomLevel(); // Funkcja, która zwraca aktualny poziom zoomu
    var fontKey = _fontName;
	
    switch (zoomLevel) {
        case ZoomLevels.Normal:
            break; // Użyj podstawowej nazwy fontu
        case ZoomLevels.Medium:
            fontKey += "_big"; // Dodaj "_big" do nazwy fontu
            break;
    }
	
	return global.fontMap[? fontKey]; // Zwraca odpowiedni font z mapy;
}

function getGUIFont(_fontName) {
	var zoomLevel = getZoomLevel(); // Funkcja, która zwraca aktualny poziom zoomu
    var fontKey = _fontName;

	return global.fontMap[? fontKey]; // Zwraca odpowiedni font z mapy;
}
