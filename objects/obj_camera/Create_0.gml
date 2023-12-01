var constrParams = get_params_byName_from_global_map(global.CONSTRUCTOR_PARAMS_CAMERA);
playerRef = constrParams[0]
cam = camera_create();
//1280x720
resolutioManagerRef = getResolutionManager();
view_width = getResolutionManager().current_width; // Ustaw jako zmienna instancji
view_height = getResolutionManager().current_height;// Ustaw jako zmienna instancji

camera_set_view_size(cam, view_width, view_height);

view_camera[0] = cam;

view_enabled = true;
view_visible[0] = true;

alarm[0] = 10;