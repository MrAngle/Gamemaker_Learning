var l2334F6EE_0;
l2334F6EE_0 = keyboard_check_pressed(ord("E"));
if (l2334F6EE_0)
{
	effect_create_above(7, x + 0, y + -20, 1, $FF00FF4C & $ffffff);

	//obj_player.coins += 50;

	instance_destroy()
}