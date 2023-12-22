// If Alarm 0 is deactivated
if(alarm[0] < 0)
{
	// This event runs when you
	// touch an enemy
	// This action will set the move_speed
	// to 0 so the player can't move anymore
	move_speed = 0;

	// Set the color to red to show the player
	// has lost
	image_blend = $FF0000FF & $ffffff;
	image_alpha = ($FF0000FF >> 24) / $ff;

	// Play "hurt" sound
	//audio_play_sound(snd_hurt, 0, 0, 1.0, undefined, 1.0);

	// Tell the Alarm 0 event to run after 20 frames
	// After 20 frames that event will restart the level
	alarm_set(0, 20);
}