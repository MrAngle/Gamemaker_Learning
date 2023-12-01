if (instance_exists(playerRef)) {
    var player_x = playerRef.x;
    var player_y = playerRef.y;

    // Centruj kamerę na graczu, zachowując widok w granicach pokoju
    var cam_x = clamp(player_x - getResolutionManager().current_width / 2, 0, room_width - getResolutionManager().current_width);
    var cam_y = clamp(player_y - getResolutionManager().current_height / 2, 0, room_height - getResolutionManager().current_height);

    camera_set_view_pos(cam, cam_x, cam_y);
} else {
	//show_debug_message("NIE ISTNIEJE GRACZ");
	//playerRef = global.players[0];
}