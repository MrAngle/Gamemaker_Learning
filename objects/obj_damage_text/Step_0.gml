// W Step Event
y -= rise_speed;        // Przesuń tekst w górę
alpha -= fade_speed;    // Zmniejsz przezroczystość tekstu

if (alpha <= 0) {
    instance_destroy(); // Zniszcz obiekt, gdy stanie się niewidoczny
}
