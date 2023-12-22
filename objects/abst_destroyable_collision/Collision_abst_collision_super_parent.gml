//if (!place_meeting(xprevious, y, abst_collision_super_parent)) {
//    x = xprevious;
//} else if (!place_meeting(x, yprevious, abst_collision_super_parent)) {
//    y = yprevious;
//} else {
//    x = xprevious;
//    y = yprevious;
//}



// Ustal dystans, o który postać może zostać przesunięta, aby ominąć przeszkodę
var avoid_distance = 4;

if (!place_meeting(xprevious, y, abst_collision_super_parent)) {
    x = xprevious;
} else if (!place_meeting(x, yprevious, abst_collision_super_parent)) {
    y = yprevious;
} else {
    // Sprawdź, czy można przesunąć postać w górę lub w dół wzdłuż przeszkody
    if (!place_meeting(x, y - avoid_distance, abst_collision_super_parent)) {
        y -= avoid_distance;
    } else if (!place_meeting(x, y + avoid_distance, abst_collision_super_parent)) {
        y += avoid_distance;
    } else {
        // Sprawdź, czy można przesunąć postać w lewo lub w prawo wzdłuż przeszkody
        if (!place_meeting(x - avoid_distance, y, abst_collision_super_parent)) {
            x -= avoid_distance;
        } else if (!place_meeting(x + avoid_distance, y, abst_collision_super_parent)) {
            x += avoid_distance;
        } else {
            // W przypadku braku możliwości uniknięcia przeszkody, wróć do poprzedniej pozycji
            x = xprevious;
            y = yprevious;
        }
    }
}