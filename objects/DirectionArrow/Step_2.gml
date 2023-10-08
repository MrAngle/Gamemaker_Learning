my_attach_to_obj_function(self);

my_current_direction = self.my_attach_to_obj.my_current_direction
//my_start_move_moveable_obj(self);

//show_debug_message(self.my_current_direction)

//var offsetX = 0; // 
//var offsetY = 0; // dodac parametry do invokera
    
var _offsets = my_calculate_offset(self.my_current_direction, sprite_get_width(self.sprite_index));
//offsetX += offsets[0];
//offsetY += offsets[1];

my_adjust_obj_image_scale_and_angle(self);

my_attach_to_obj_with_offsets(self, _offsets[0], _offsets[1])

