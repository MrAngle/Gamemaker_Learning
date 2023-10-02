// Najpierw rysuj sprite gracza
draw_self();

if (aiming) {
    show_debug_message("PROBUJE RYSOWAC");
    var length = 128;  // Długość wskaźnika kierunku
    var aim_x = x + lengthdir_x(length, aim_angle);
    var aim_y = y + lengthdir_y(length, aim_angle);
    
    draw_set_color(c_red);
    draw_line_width(x, y, aim_x, aim_y, 2);  // 2 to grubość linii; dostosuj według potrzeb
}