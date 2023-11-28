// Najpierw rysuj sprite gracza

draw_self();

if (my_STATE_aiming) {
    var length = 128;  // Długość wskaźnika kierunku
    var aim_x = x + lengthdir_x(length, my_get_aim_angle(self));
    var aim_y = y + lengthdir_y(length, my_get_aim_angle(self));
    
    draw_set_color(c_red);
    draw_line_width(x, y, aim_x, aim_y, 2);  // 2 to grubość linii; dostosuj według potrzeb
}

event_inherited();