if (self.privPaused) {
	var cam_x = camera_get_view_x(view_camera[0]);
	var cam_y = camera_get_view_y(view_camera[0]);
	
	// Tak, to jest ceolowo do kwadratu
	var surfaceWidth = camera_get_view_width(view_camera[0]) * getZoomFactor() * getZoomFactor();
    var surfaceHeight = camera_get_view_height(view_camera[0]) * getZoomFactor() * getZoomFactor();
	
	//draw_surface(self.pause_surface, cam_x, cam_y);
	 draw_surface_stretched(self.pause_surface, cam_x, cam_y, surfaceWidth, surfaceHeight);
} else {
	resumeButton = undefined;
}