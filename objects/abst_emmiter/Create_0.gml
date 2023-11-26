//image_speed = 1; // Ustaw szybkość animacji, żeby pasowała do długości eksplozji
var total_frames = sprite_get_number(sprite_index);
var animation_speed = image_speed;

alarm[0] = (animation_speed / total_frames) * global.MY_ROOM_SPEED;