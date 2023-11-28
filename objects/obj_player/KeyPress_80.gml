//global.paused = !global.paused; // Toggle pause state
//if (global.paused) {
	
//	    //global.paused = !global.paused;
//// When toggling the pause

//    if (global.paused) {
//        // Create a surface and copy the application surface
//        global.pause_surface = surface_create(	camera_get_view_width(view_camera[0]), 
//												camera_get_view_height(view_camera[0]));
//        var cam_x = camera_get_view_x(view_camera[0]);
//        var cam_y = camera_get_view_y(view_camera[0]);
//        surface_copy(global.pause_surface, 0, 0, application_surface);
//        global.camera_x = cam_x;
//        global.camera_y = cam_y;
//    }
//	instance_deactivate_all(true);
//} else {
//    instance_activate_all(); // Reactivate instances when unpaused
//}

getPauseManager().stopTheGame(getPauseManager());