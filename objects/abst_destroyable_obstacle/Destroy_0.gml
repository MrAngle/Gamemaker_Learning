event_inherited();

//if (global.MY_GRID_MAP_PATH) {
//    // Wyczyść obszar siatki, gdzie znajdowała się beczka
//       // Oblicz granice przeszkody w siatce
//    var cell_size = global.MY_GRID_MAP_PATH_CELL_SIZE;
//    var grid_left = floor(bbox_left / cell_size);
//    var grid_top = floor(bbox_top / cell_size);
//    var grid_right = floor(bbox_right / cell_size);
//    var grid_bottom = floor(bbox_bottom / cell_size);

//	show_debug_message("Clearing grid from " + string(grid_left) + "," + string(grid_top) + " to " + string(grid_right) + "," + string(grid_bottom));
//    // Wyczyść obszar siatki, gdzie znajdowała się przeszkoda
//    mp_grid_clear_rectangle(global.MY_GRID_MAP_PATH, grid_left, grid_top, grid_right, grid_bottom);
//}