// The broadcast messages for this object are set
// up in the baddie walk sprites, where each footstep
// frame has a broadcast message assigned to it.
// This action retrieves the message received from the
// event_data map.
var message = ds_map_find_value(event_data, "message");

// This condition checks if the received message is
// "baddie_step".
if(message == "baddie_step")
{
	// This condition checks if the player instance exists.
	var l24164087_0 = false;
	l24164087_0 = instance_exists(obj_player);
	if(l24164087_0)
	{
		// This gets the distance from this baddie instance
		// to the player.
		var distance = point_distance(x, y, obj_player.x, obj_player.y);
	
		// If the distance to the player is less than 300,
		if(distance < 300)
		{
			// This plays the baddie footstep sound.
			// The ID of the played sound is stored
			// in the "footstep" variable (which is marked
			// as temporary).
			var footstep = audio_play_sound(snd_baddie_footstep, 0, 0, 1.0, undefined, 1.0);
		
			// The volume of the footstep sound is changed
			// based on this distance to the player. This way
			// it is louder when the baddie is close to the player,
			// but fainter as it gets farther.
			audio_sound_gain(footstep, min(50 / distance, 1), 0);
		}
	}
}