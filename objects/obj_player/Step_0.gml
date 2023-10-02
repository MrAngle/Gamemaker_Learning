
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