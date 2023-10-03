
//if (keyboard_check(vk_up) && keyboard_check(vk_left)) 
//{
//    player_direction = "up_left";
//}
//else if (keyboard_check(vk_up) && keyboard_check(vk_right))
//{
//    player_direction = "up_right";
//}

var _my_direction_before_check = my_current_direction;

if (keyboard_check(vk_up)) 
{
    if (keyboard_check(vk_left)) 
    {
        my_current_direction = MY_Direction.UP_LEFT;
    }
    else if (keyboard_check(vk_right))
    {
        my_current_direction = MY_Direction.UP_RIGHT;
    }
    else 
    {
        my_current_direction = MY_Direction.UP;
    }
}
else if (keyboard_check(vk_down)) 
{
    if (keyboard_check(vk_left)) 
    {
        my_current_direction = MY_Direction.DOWN_LEFT;
    }
    else if (keyboard_check(vk_right))
    {
        my_current_direction = MY_Direction.DOWN_RIGHT;
    }
    else 
    {
        my_current_direction = MY_Direction.DOWN;
    }
}
else if (keyboard_check(vk_left))
{
    my_current_direction = MY_Direction.LEFT;
}
else if (keyboard_check(vk_right))
{
    my_current_direction = MY_Direction.RIGHT;
}

//if(_my_direction_before_check != my_current_direction) {
//	my_load_direction_arrow_gui(self)
//}
//show_debug_message("ide" + string(my_current_direction));



//if (keyboard_check(vk_shift)) {
//    aiming = true;

//    // Aktualizuj kierunek celowania w zależności od wciśniętych klawiszy
//    //if (keyboard_check(vk_right)) aim_angle += 2;  // Dostosuj wartość "2" w zależności od tego, jak szybko chcesz obracać się
//    //if (keyboard_check(vk_left)) aim_angle -= 2;

//    //// Ogranicz aim_angle do zakresu 0-360
//    //if (aim_angle >= 360) aim_angle -= 360;
//    //if (aim_angle < 0) aim_angle += 360;
	
	
//	if (keyboard_check(vk_shift)) {
//    aiming = true;

//    var horz = 0;
//    var vert = 0;

//    if (keyboard_check(vk_right)) horz += 1;
//    if (keyboard_check(vk_left)) horz -= 1;
//    if (keyboard_check(vk_down)) vert += 1;
//    if (keyboard_check(vk_up)) vert -= 1;

//    // Jeśli jakikolwiek kierunek jest wciskany, aktualizuj aim_angle
//    if (horz != 0 || vert != 0) {
//        aim_angle = point_direction(0, 0, horz, vert);
//    }
//} else {
//    aiming = false;
//}
//} else {
//    aiming = false;
//}

function closest_multiples_of_45(target) {
    return round(target / 45) * 45;
}

function modified_angle_difference(angle1, angle2) {
    var diff = (angle2 - angle1) mod 360;

    if (diff > 180) {
        diff -= 360;
    }

    if (diff < -180) {
        diff += 360;
    }

    if (diff == -180) {
        return 180;
    }

    return diff;
}

if (keyboard_check(vk_shift)) {
    my_STATE_aiming = true;

    var horz = 0;
    var vert = 0;

    if (keyboard_check(vk_left)) horz -= 1; 
    if (keyboard_check(vk_right)) horz += 1; 
    if (keyboard_check(vk_down)) vert -= 1; // Zmieniamy znak dla strzałki w dół
    if (keyboard_check(vk_up)) vert += 1;   // Zmieniamy znak dla strzałki w górę

    // Odwracamy wartość vert, aby dostosować się do układu współrzędnych w GameMaker
    vert = -vert;

    if (horz != 0 || vert != 0) {
        var target_angle = point_direction(0, 0, horz, vert);
        var closest_angle = closest_multiples_of_45(target_angle);
        var diff_angle = modified_angle_difference(my_get_aim_angle(self), target_angle);

        var rotation_speed = 4;

        if (abs(modified_angle_difference(target_angle, closest_angle)) < 1) {
            target_angle = closest_angle;
        }

        if (abs(diff_angle) < rotation_speed) {
            my_set_aim_angle(self, target_angle);
        } else {
            my_set_aim_angle(self, my_get_aim_angle(self) + sign(diff_angle) * rotation_speed);
        }

        // Ogranicz aim_angle do zakresu 0-360
        if (my_get_aim_angle(self) >= 360) {
            my_set_aim_angle(self, my_get_aim_angle(self) - 360);
        }
        if (my_get_aim_angle(self) < 0) {
            my_set_aim_angle(self, my_get_aim_angle(self) + 360);
        }
    }
} else {
    my_STATE_aiming = false;
}












//if (keyboard_check(vk_shift)) {
//    aiming = true;

//    var horz = 0;
//    var vert = 0;

//    if (keyboard_check(vk_left)) horz -= 1;
//    if (keyboard_check(vk_right)) horz += 1;
//    if (keyboard_check(vk_down)) vert += 1;
//    if (keyboard_check(vk_up)) vert -= 1;

//    // Jeśli jakikolwiek kierunek jest wciskany, aktualizuj aim_angle
//    if (horz != 0 || vert != 0) {
//        var raw_angle = point_direction(0, 0, horz, vert);

//        // Zamieniamy surowy kąt na jeden z 8 kierunków
//        var discrete_angle = round(raw_angle / 45) * 45;
//        aim_angle = discrete_angle % 360;
//    }

//} else {
//    aiming = false;
//}





















//function lerp_angle(start_angle, end_angle, t) {
//    var difference = angle_difference(start_angle, end_angle);
//    return start_angle + difference * t;
//}

//if (keyboard_check(vk_shift)) {
//    aiming = true;

//    var horz = 0;
//    var vert = 0;

//    if (keyboard_check(vk_left)) horz += 1;
//    if (keyboard_check(vk_right)) horz -= 1;
//    if (keyboard_check(vk_down)) vert += 1;
//    if (keyboard_check(vk_up)) vert -= 1;

//    // Odwracamy wartość vert, aby dostosować się do układu współrzędnych w GameMaker
//    vert = -vert;

//    // Jeśli jakikolwiek kierunek jest wciskany, aktualizuj aim_angle
//    if (horz != 0 || vert != 0) {
//        var target_angle = point_direction(0, 0, horz, vert);
//        var diff_angle = angle_difference(aim_angle, target_angle);

//        var rotation_speed = 2; // Prędkość obracania; dostosuj według potrzeb
//        if (abs(diff_angle) < rotation_speed) {
//            aim_angle = target_angle; // Jeśli jesteś wystarczająco blisko, ustaw kąt celowania na wartość docelową
//        } else {
//            aim_angle += sign(diff_angle) * rotation_speed; // W przeciwnym razie obracaj się w kierunku docelowym
//        }

//        // Ogranicz aim_angle do zakresu 0-360
//        if (aim_angle >= 360) aim_angle -= 360;
//        if (aim_angle < 0) aim_angle += 360;
//    }
//} else {
//    aiming = false;
//}
