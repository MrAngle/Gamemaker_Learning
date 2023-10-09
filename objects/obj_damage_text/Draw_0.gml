// W Draw Event
draw_text_ext_transformed_colour(
    x,                      // Pozycja x tekstu
    y,                      // Pozycja y tekstu
    string(damage),         // Tekst do narysowania (wartość obrażeń)
    -1,                     // Odstęp między liniami; -1 oznacza domyślny odstęp
    -1,                     // Szerokość, po której tekst będzie zawijany; -1 oznacza brak zawijania
    1,                      // Skalowanie w poziomie; 1 oznacza brak skalowania
    1,                      // Skalowanie w pionie; 1 oznacza brak skalowania
    0,                      // Kąt obrotu tekstu; 0 oznacza brak obrotu
    c_white,                // Kolor w lewym górnym rogu
    c_white,                // Kolor w prawym górnym rogu
    c_white,                // Kolor w lewym dolnym rogu
    c_white,                // Kolor w prawym dolnym rogu
    alpha                   // Przezroczystość tekstu; powinna być zdefiniowana wcześniej i mieć wartość od 0 do 1
);