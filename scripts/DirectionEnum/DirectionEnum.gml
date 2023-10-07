// // W wersji v2.3.0 zmieniono zasoby skryptu. Więcej informacji można znaleźć pod adresem
// // https://help.yoyogames.com/hc/en-us/articles/360005277377
enum MY_Direction {
    UP,
    DOWN,
    LEFT,
    RIGHT,
    UP_LEFT,
    UP_RIGHT,
    DOWN_LEFT,
    DOWN_RIGHT
}


function my_get_sprite_based_on_direction(_directionEnum) {
    switch (direction) {
        case MY_Direction.UP:
            return spr_Player_Up;

        case MY_Direction.DOWN:
            return spr_Player_Down;

        case MY_Direction.LEFT:
            return spr_Player_Left;

        case MY_Direction.RIGHT:
            return spr_Player_Right;

        case MY_Direction.UP_LEFT:
            return spr_Player_Up_Left;

        case MY_Direction.UP_RIGHT:
            return spr_Player_Up_Right;

        case MY_Direction.DOWN_LEFT:
            return spr_Player_Down_Left;

        case MY_Direction.DOWN_RIGHT:
            return spr_Player_Down_Right;

        default:
            // Jeśli podany kierunek nie pasuje do żadnej z wartości enum, zwróć domyślny sprite (na przykład spr_Player_Idle)
            return spr_Player_Idle;
    }
}