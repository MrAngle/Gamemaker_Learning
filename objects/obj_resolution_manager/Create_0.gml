//view_enabled = true;

//view_visible[0] = true; // Włącza widok
//view_xview[0] = 100; // Początek widoku x w room
//view_yview[0] = 100; // Początek widoku y w room
//view_wview[0] = 800; // Szerokość widoku
//view_hview[0] = 600; // Wysokość widoku

//view_xport[0] = 0; // Początek portu x na ekranie
//view_yport[0] = 0; // Początek portu y na ekranie
//view_wport[0] = 800; // Szerokość portu na ekranie
//view_hport[0] = 600; // Wysokość portu na ekranie

currentResolution = ZoomLevels.Normal;

obj_Player = undefined;
original_width = 1280; // Przykładowa początkowa szerokość
original_height = 720; // Przykładowa początkowa wysokość

current_width = original_width;
current_height = original_height;

zoomFactor = 1;

changeResolution = function (_self) {
	with(_self) {
		currentResolution = (currentResolution + 1) % 2;
        var cam = view_camera[0];

        switch (currentResolution) {
            case ZoomLevels.Normal:
                zoomFactor = 1;
                break;
            case ZoomLevels.Medium:
                zoomFactor = 2;
                break;
            //case ZoomLevels.Far:
            //    zoomFactor = 3;
            //    break;
        }

        current_width = original_width * zoomFactor;
        current_height = original_height * zoomFactor;
        
        camera_set_view_size(cam, current_width, current_height);

        // Opcjonalnie, dostosuj pozycję kamery
        var camX = camera_get_view_x(cam) - (current_width - original_width) / 2;
        var camY = camera_get_view_y(cam) - (current_height - original_height) / 2;
        camera_set_view_pos(cam, camX, camY);
    }
}