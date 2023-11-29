//if (mouse_check_button_pressed(mb_left)) { // Check if left mouse button is pressed
//    var mouse_gui_x = device_mouse_x_to_gui(0); // Get the mouse x position in GUI coordinates
//    var mouse_gui_y = device_mouse_y_to_gui(0); // Get the mouse y position in GUI coordinates

//    // Calculate the sprite's bounding box
//    var sprite_left = button_x;
//    var sprite_top = button_y;
//    var sprite_right = sprite_left + sprite_get_width(spr_button);
//    var sprite_bottom = sprite_top + sprite_get_height(spr_button);

//    // Check if the mouse is inside the sprite's bounding box
//    if (point_in_rectangle(mouse_gui_x, mouse_gui_y, sprite_left, sprite_top, sprite_right, sprite_bottom)) {
//		self.startTheGame(self);
//        // Execute button click logic here
//    }
//}